'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "897540e720977dd3b6532f27675ec24c",
".git/config": "100a5bb732832fde21efd76df374116b",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "42cdd843a1bc232d6e77c7130c181c83",
".git/gitk.cache": "a1dabae2d9e35f1d56318031981ef855",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "f2ba683b8b62827fe6ae9a2bc2b7009a",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "fa4034261c280145d5eeeb1343abef61",
".git/logs/refs/heads/gh-pages": "35f89d072fcf6421c5826876c9d7b757",
".git/logs/refs/heads/master": "317d15a494d6ae7df7f6905ce44de170",
".git/logs/refs/remotes/origin/gh-pages": "5b1982fa975f379fa4ff07d0c7811338",
".git/logs/refs/remotes/origin/HEAD": "817ab8841aa00aa078ae194a6a01ca3d",
".git/logs/refs/remotes/origin/master": "24bb1272c5990e115168dac7c0cf2338",
".git/objects/02/21bde589de8ffd7f96f53c259729715c74bfa3": "9233c45a88ab4a8b7192a3e162f8fe14",
".git/objects/69/09ab96415887996421ab606a8406ed17cb4e96": "43b578ce73e269ef01a2e73acd89a0ed",
".git/objects/e6/20d1d0a019010c1640976f430ed5344bc76994": "7deb7b851903c65422b86f6ca98e1e93",
".git/objects/f4/a8716c5610777ef93642c90788248b6f872574": "25a8c4dca61abef21c6bf3536eaa9168",
".git/objects/fe/03ada1322310f542288f4dc5d81bf4c00d5c19": "853dc4754b1a2c6900db5daea5ae3a74",
".git/objects/pack/pack-24e0a2e0cfff8a92efe1bbe1c8ce6c15e919bb63.idx": "f547dfced672fff32757d1c5ae59e59f",
".git/objects/pack/pack-24e0a2e0cfff8a92efe1bbe1c8ce6c15e919bb63.pack": "193f01f1bb2daa9d2f18415e978790b3",
".git/packed-refs": "1fe3930efeef2dc8f038fc7f0b6372d3",
".git/refs/heads/gh-pages": "2efe6a62dd39cb79546bb22f1f97aa64",
".git/refs/heads/master": "1ebaacfe6ee400523ad76e62afa7dcf6",
".git/refs/remotes/origin/gh-pages": "2efe6a62dd39cb79546bb22f1f97aa64",
".git/refs/remotes/origin/HEAD": "73a00957034783b7b5c8294c54cd3e12",
".git/refs/remotes/origin/master": "1ebaacfe6ee400523ad76e62afa7dcf6",
"assets/AssetManifest.json": "62c8918d6c8eaae7ec6d160a3a9ea2ab",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1288c9e28052e028aba623321f7826ac",
"assets/images/dice-dark-1.png": "e58be15f9b1c84be053948b978249ef2",
"assets/images/dice-dark-2.png": "fab0963fea2c29cf6b3e5190b2e49a12",
"assets/images/dice-dark-3.png": "269a09f5d99b2155c1547c774fd60b2b",
"assets/images/dice-dark-4.png": "7dbb961dfcdecb4f87374582b740ebab",
"assets/images/dice-dark-5.png": "c9c570e11ecb7f217f29e37587059d99",
"assets/images/dice-dark-6.png": "6ff51da6895ed6661d6ef69849f8e2ad",
"assets/images/dice-light-1.png": "62884f2e637ad367168b49e2661f4a14",
"assets/images/dice-light-2.png": "ecf4119f04fbadb90736ef5a7a1a3f55",
"assets/images/dice-light-3.png": "8b33b00305486926a13a3f89728c74bd",
"assets/images/dice-light-4.png": "d4d26e2bcd265ace3e9bea7daadb1897",
"assets/images/dice-light-5.png": "d703206844a8e969cae376e5f7592488",
"assets/images/dice-light-6.png": "8f4d85387f53d02f9fc3ddcc4a64aadb",
"assets/NOTICES": "a2540d7e4d380792eb05802736d4ba17",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "6b3f0078c43165538f61d1d641036012",
"/": "6b3f0078c43165538f61d1d641036012",
"main.dart.js": "471206ae84871b05ed228f2b8bd962cb",
"manifest.json": "284f89ac919a867d236a4b747ff751f5",
"version.json": "3b2a7ed387563fe404673ec821ff4657"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value + '?revision=' + RESOURCES[value], {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
