'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "0591507f6276e016a4b9ca4cded1d725",
"assets/assets/images/ads.png": "af2c7afc19c0b047a458c10755be2ea7",
"assets/assets/images/ads2.png": "00cef744d8c264cc209d37c62a9772b9",
"assets/assets/images/ads3.png": "d0ee17f4774f9f1f94b455dc02587a23",
"assets/assets/images/adsmcd.png": "75ff42733ced1df794e47fb078062b26",
"assets/assets/images/bacon_ranch_salad.png": "35f7c94cf57058c665b441fb53214a00",
"assets/assets/images/beverages.png": "073e0e43053eb1b698cc1632eb0498fa",
"assets/assets/images/big_mac.png": "d71a0f78cc835e2b54a67e2095282745",
"assets/assets/images/burgers_and_sandwiches.png": "1ad32876d5c583d35a8a04c1c6f82812",
"assets/assets/images/carticon.png": "a81f9260ca26877e3531cb3ac8bf2f85",
"assets/assets/images/carticon2.png": "f65fdc7c4c44fa71083d56fb06fa4bc3",
"assets/assets/images/cheeseburger.png": "68f221be2cee31ecb88b5ccdd606ecef",
"assets/assets/images/chicken.png": "12ffd3f0109289bbab15879cbfb2f5f7",
"assets/assets/images/combo_meal.png": "67716390ec55d38ee3450c34739ab107",
"assets/assets/images/dimsum.png": "5df8b9b1358125114453e94b31aff7b9",
"assets/assets/images/double_quarter_pounder.png": "5db6e68e9d3cc94892e0862339a58c59",
"assets/assets/images/filet_o_fish.png": "ec56e09818bead677df79dd7c8ec8b46",
"assets/assets/images/happy_meal.png": "0134ae2b5caa0adb1de7d2d7538799d2",
"assets/assets/images/icons.png": "800c49ead3e39d32a9722a23c3f0bd6b",
"assets/assets/images/logo.png": "658c963509698e79b83865276772b43e",
"assets/assets/images/logo.svg": "ec3ed36bb806449a86f3eb891b16da71",
"assets/assets/images/moreicon.png": "63505c5bfc75ecc57967c3323622916e",
"assets/assets/images/noodle.png": "f376e2b3fcd20271d5f4a97813bf873f",
"assets/assets/images/profileicon.png": "465e4132e604670d0cab337444cadb46",
"assets/assets/images/quarter_pounder.png": "b4d4ffdf8f9940ddead4c590722c77c9",
"assets/assets/images/searchicon.png": "39ee142de2ca9e436022bea34b9e6add",
"assets/assets/images/snacks_and_sides.png": "ea5fb492ff3ed9bb780b70883dbfe7c6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "b820256e6d2d5f4411431af1756016de",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "968108b1a5f9260a70b59dfa9b37d471",
"/": "968108b1a5f9260a70b59dfa9b37d471",
"main.dart.js": "71382bc9278a8dd8c6c48e91a07007af",
"manifest.json": "1ec134ff322140fc5ea4cda2784988ce",
"version.json": "d08646c976e2361c435d8e805f701bb3"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
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
