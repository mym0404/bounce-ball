'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "4f10dffd0faa4a8a294288c0dea15c70",
"splash/img/light-2x.png": "eb2bdcce6fc140a31876d19a05513d7a",
"splash/img/dark-4x.png": "7e737ee05d1b7691ab79a3006ed8f876",
"splash/img/light-3x.png": "f5050f9eded1ab560b69e1c9ae236286",
"splash/img/dark-3x.png": "f5050f9eded1ab560b69e1c9ae236286",
"splash/img/light-4x.png": "7e737ee05d1b7691ab79a3006ed8f876",
"splash/img/dark-2x.png": "eb2bdcce6fc140a31876d19a05513d7a",
"splash/img/dark-1x.png": "78e860ef7c3ee90ab77926c216313948",
"splash/img/light-1x.png": "78e860ef7c3ee90ab77926c216313948",
"index.html": "8169a3cc27363f1f7e969f7c905ff540",
"/": "8169a3cc27363f1f7e969f7c905ff540",
"main.dart.js": "dea84619193c105744c811343226422b",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "b4126bff337ad0f4520998229064e00c",
"icons/Icon-192.png": "0dbebe0993612c266b8748b5450676f8",
"icons/Icon-maskable-192.png": "0dbebe0993612c266b8748b5450676f8",
"icons/Icon-maskable-512.png": "eb2bdcce6fc140a31876d19a05513d7a",
"icons/Icon-512.png": "eb2bdcce6fc140a31876d19a05513d7a",
"manifest.json": "abd592871065844513e44a73c9625a2b",
"google1412e6e86cbe747b.html": "e0a2a66fda650b5f070b11377183ce0b",
"assets/AssetManifest.json": "84f6c4be659559dc70609256caa9f06b",
"assets/NOTICES": "048d4d26a042290156502b12844e7748",
"assets/FontManifest.json": "d950fa3eb7528854819563e83e7c9aff",
"assets/AssetManifest.bin.json": "491cbee1ab758eba5302321dcbc311f8",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "3759b2f7a51e83c64a58cfe07b96a8ee",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "f65a077082f63f13f903930f3c5abb05",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/assets/images/background/blue.png": "c9b2b76a3cc7bb50acd5f1e6836efeb5",
"assets/assets/images/background/green.png": "26b328e739321f08eac2947cfc879dde",
"assets/assets/images/background/star1.png": "c9d41d81320f596ef7ac695f8c9b69dd",
"assets/assets/images/background/star3.png": "1547329975a5d8daf981cec54a084876",
"assets/assets/images/background/star2.png": "652f77ba6623e11909c44cb55a0ef965",
"assets/assets/images/background/purple.png": "1800dc1ed5520fddbc3cee0ef1399964",
"assets/assets/images/tile.png": "9d2f8f9f37f58616d2f50f0a6c432896",
"assets/assets/images/planet/empty.png": "c72ced0adb9bce39036b1aaffbea11bb",
"assets/assets/images/planet/world1.png": "fcb405ad9d79e173e0d30c11ff18bb45",
"assets/assets/images/planet/world2.png": "8dc86618c323179182c2016818ce21de",
"assets/assets/images/planet/loading.png": "838777f139fe3604a8afb10ecdca435e",
"assets/assets/images/effect/smoke/smoke1.png": "4c387b412b864e8f7e5879c3cfe82541",
"assets/assets/images/effect/smoke/smoke2.png": "dbf980673957b4826260d14301751680",
"assets/assets/images/effect/smoke/smoke3.png": "dbf7cbc48a781a32dfd38e7f3495b0ce",
"assets/assets/images/effect/smoke/smoke4.png": "41deda79994866bb814eafa42aabbf5b",
"assets/assets/images/logo1024.png": "1cf89842e0cb2815f584ad4b775e9aff",
"assets/assets/tiles/lv1_1.tmx": "53f5e882b4c7f3a7615e4fbd6ef0712b",
"assets/assets/tiles/lv1_2.tmx": "5508bedabe86b23e24350fba9617f4bf",
"assets/assets/tiles/lv1_3.tmx": "4e5203bd39a714fe9d5ca1d829442c18",
"assets/assets/tiles/lv1_7.tmx": "73a958d882c5623080514800fd190a02",
"assets/assets/tiles/lv1_6.tmx": "312856616f0d3f48c213370e8eb6462b",
"assets/assets/tiles/lv1_4.tmx": "147c5a9d37486b80c391746c6e96ce32",
"assets/assets/tiles/lv1_5.tmx": "62d68264a9adcf4263ab52276ce22a57",
"assets/assets/tiles/lv5_1.tmx": "226fc44074d1705f074009ba42943366",
"assets/assets/tiles/lv1_8.tmx": "88ac7c169e9361ac2c5399eac379c22d",
"assets/assets/tiles/tile.tiled-session": "c0b469c73eb8f44454f32e8f3063510c",
"assets/assets/tiles/Tiles.tsx": "2dce837718a7e1f158a5bc652064bad6",
"assets/assets/tiles/tile.tiled-project": "97165873765b29a5041f09e541be15d5",
"assets/assets/audio/clear.wav": "0d17170a34ca37865bb23c33ffb6fefe",
"assets/assets/audio/bounce.wav": "9e180da9dc10055d1d3b281499b7fee9",
"assets/assets/audio/die_bomb.wav": "25bc90866503b30564af2b97f0341394",
"assets/assets/audio/arrow.wav": "4061c4f6a3004e919c2858bccf2a3afd",
"assets/assets/audio/die_outofbound.wav": "302a977a55a38f0d3c637d89be0cfa24",
"assets/assets/audio/bgm/world1.wav": "62dcc6c263aae9d2cd2707c2cf23291f",
"assets/assets/audio/jump_wall.wav": "f9b282d9d179d2ee45131d49f57ca09f",
"assets/assets/lottie/clear.json": "c86cedeebd8a2798a785e6651f2415f0",
"assets/assets/fonts/stardust.ttf": "c3676a90517c44156721473855cf8444",
"assets/assets/fonts/stardust_bold.ttf": "709bffb570396344155a9a1a50f018c6",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
