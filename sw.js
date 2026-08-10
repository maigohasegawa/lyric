/* VHS / GLITCH CAM — Service Worker
   アプリ本体をキャッシュして、機内モードでも起動できるようにする。
   本体を更新したら CACHE のバージョンを上げること。 */

const CACHE   = 'vhscam-v2';
const RUNTIME = 'vhscam-runtime-v2';

const SHELL = [
  './',
  './index.html',
  './vhs-glitch-cam.html',
  './manifest.webmanifest',
  './icons/icon-192.png',
  './icons/icon-512.png',
  './icons/icon-maskable-512.png',
  './icons/apple-touch-icon.png',
];

self.addEventListener('install', event => {
  event.waitUntil((async () => {
    const cache = await caches.open(CACHE);
    // 1つでも失敗すると addAll 全体が失敗するので個別に入れる
    await Promise.all(SHELL.map(url =>
      cache.add(new Request(url, {cache: 'reload'})).catch(() => {})
    ));
    await self.skipWaiting();
  })());
});

self.addEventListener('activate', event => {
  event.waitUntil((async () => {
    const keys = await caches.keys();
    await Promise.all(keys
      .filter(k => k !== CACHE && k !== RUNTIME)
      .map(k => caches.delete(k)));
    await self.clients.claim();
  })());
});

self.addEventListener('message', event => {
  if (event.data === 'skipWaiting') self.skipWaiting();
});

self.addEventListener('fetch', event => {
  const req = event.request;
  if (req.method !== 'GET') return;

  const url = new URL(req.url);
  const sameOrigin = url.origin === self.location.origin;

  // Webフォントなど外部リソース：キャッシュ優先＋裏で更新
  if (!sameOrigin) {
    if (/fonts\.(googleapis|gstatic)\.com$/.test(url.hostname)) {
      event.respondWith(staleWhileRevalidate(req, RUNTIME));
    }
    return;
  }

  // アプリ本体：キャッシュ優先（オフラインでも起動できる）＋裏で更新
  event.respondWith(staleWhileRevalidate(req, CACHE));
});

async function staleWhileRevalidate(req, cacheName) {
  const cache = await caches.open(cacheName);
  const cached = await cache.match(req, {ignoreSearch: false});

  const network = fetch(req).then(res => {
    if (res && (res.ok || res.type === 'opaque')) cache.put(req, res.clone()).catch(() => {});
    return res;
  }).catch(() => null);

  if (cached) return cached;

  const fresh = await network;
  if (fresh) return fresh;

  // オフラインでナビゲーションに失敗したらアプリ本体を返す
  if (req.mode === 'navigate') {
    const fallback = await cache.match('./vhs-glitch-cam.html');
    if (fallback) return fallback;
  }
  return new Response('オフラインです', {status: 503, headers: {'Content-Type': 'text/plain; charset=utf-8'}});
}
