/* iOSアプリ版に入れるファイルを www/ にまとめる。
   ウェブ版（GitHub Pages）はリポジトリのルートをそのまま配信しているので、
   アプリに必要なものだけをここでコピーする。
   使い方： npm run build                                          */

import { mkdirSync, copyFileSync, rmSync, readdirSync } from 'fs';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const www  = join(root, 'www');

// アプリに入れるもの。sw.js と manifest はアプリ版では使わないので入れない
// （端末内のファイルを直接読むため、キャッシュもインストール導線も不要）
const FILES = ['index.html', 'privacy.html'];
const DIRS  = ['icons'];

rmSync(www, { recursive: true, force: true });
mkdirSync(www, { recursive: true });

for (const f of FILES) {
  copyFileSync(join(root, f), join(www, f));
  console.log('copied', f);
}

for (const d of DIRS) {
  mkdirSync(join(www, d), { recursive: true });
  for (const f of readdirSync(join(root, d))) {
    copyFileSync(join(root, d, f), join(www, d, f));
  }
  console.log('copied', d + '/');
}

console.log('\nwww/ を作りました。次に：npx cap sync ios');
