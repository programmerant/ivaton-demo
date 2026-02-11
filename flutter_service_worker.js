'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "fa964115640706ef5ae5480156af5524",
"assets/AssetManifest.bin.json": "9c4e9b52e0e96c8875619eb072444c9f",
"assets/AssetManifest.json": "88c5d6ca2092e6a3bded2086e5b8c793",
"assets/assets/images/pools/IMG-20250309-WA0000.jpg": "dd1899ade69564344753ad8520a8beec",
"assets/assets/images/pools/IMG-20250309-WA0002.jpg": "5125391c8048801c62b27e1761c16313",
"assets/assets/images/pools/IMG-20250309-WA0003.jpg": "6a0de08a73873e28b50c88dc556d34a9",
"assets/assets/images/pools/IMG-20250309-WA0004.jpg": "6e8a65ba0f9864efc4111795420e611c",
"assets/assets/images/pools/IMG-20250309-WA0005.jpg": "a6fa08e9ce109b0e30a1b4b40911c225",
"assets/assets/images/pools/IMG-20250309-WA0006.jpg": "9b393859e5320bdd5457b61d55192d2b",
"assets/assets/images/pools/IMG-20250309-WA0007.jpg": "7b6dd9ab8e42c4adc39c3a17bfcedff6",
"assets/assets/images/pools/IMG-20250309-WA0008.jpg": "37ca5ecec2f962c0b56fe041b09ac257",
"assets/assets/images/pools/IMG-20250309-WA0010.jpg": "8d4a51772145957dedc69d4d981ec548",
"assets/assets/images/pools/IMG-20250309-WA0011.jpg": "bf355de1b47c8d337ffda8835f2ef8b4",
"assets/assets/images/pools/IMG-20250309-WA0013.jpg": "73ff4476e6a18b2ff30454905e99fcc1",
"assets/assets/images/pools/IMG-20250309-WA0015.jpg": "39fe303d98380d579224d767e1a6bbe4",
"assets/assets/images/pools/IMG-20250309-WA0016.jpg": "e32737a095359f0452096f75c456dab8",
"assets/assets/images/pools/IMG-20250309-WA0017.jpg": "0ea3a1f46abdcb77c5bc8a6c6c225f40",
"assets/assets/images/pools/IMG-20250309-WA0018.jpg": "9bc75406f0f2278618b5cb0272fdc319",
"assets/assets/images/pools/IMG-20250309-WA0019.jpg": "f1c340c24d2c52a653f173df35319c1c",
"assets/assets/images/pools/IMG-20250309-WA0020.jpg": "5e3fa8eea6c3598e519d9e9d36bdb4f8",
"assets/assets/images/pools/IMG-20250309-WA0023.jpg": "26fd1bdebb2900a9035f9d3ed9e66421",
"assets/assets/images/pools/IMG-20250309-WA0026.jpg": "05437db8675c4d670696925e13809d0d",
"assets/assets/images/pools/IMG-20250309-WA0027.jpg": "14613cbcf72515fafab8258b3861b333",
"assets/assets/images/pools/IMG-20250309-WA0028.jpg": "ab48949fd99cd5b9602d87da20408c7a",
"assets/assets/images/pools/IMG-20250309-WA0029.jpg": "a3e2c717e94733a83b2d6c97271e4086",
"assets/assets/images/pools/IMG-20250309-WA0030.jpg": "c0cf182cefab145fc2a142a1cdcceac3",
"assets/assets/images/pools/IMG-20250309-WA0031.jpg": "35ab34941dd8c801981b6b3847e814d2",
"assets/assets/images/pools/IMG-20250309-WA0033.jpg": "ac9662a05db4d357df4c5fb12c9e5526",
"assets/assets/images/pools/IMG-20250309-WA0034.jpg": "78ddec2cb5cf6d8159971b9c03ebe823",
"assets/assets/images/pools/IMG-20250309-WA0035.jpg": "b8a7493650149553f740c07bf798bada",
"assets/assets/images/pools/IMG-20250309-WA0036.jpg": "b24386d757c391856d24c188023699f9",
"assets/assets/images/pools/IMG-20250309-WA0037.jpg": "a74f7ed98a153ec65d20ef212853e904",
"assets/assets/images/pools/IMG-20250309-WA0038.jpg": "958ffc259179846779186f59219782f8",
"assets/assets/images/pools/IMG-20250309-WA0039.jpg": "4cd36e75bf3eb499685cda32318c95d6",
"assets/assets/images/pools/IMG-20250309-WA0040.jpg": "9a08d3367be4d9b593f1b3402246d150",
"assets/assets/images/pools/IMG-20250309-WA0041.jpg": "c28279b914cb2717dd2a0d739de631f7",
"assets/assets/images/pools/IMG-20250309-WA0042.jpg": "16489d25a71c59c5a21e5ef287d89467",
"assets/assets/images/pools/IMG-20250309-WA0043.jpg": "25144a3bbdabaf5cbec73d852f1d7a54",
"assets/assets/images/pools/IMG-20250309-WA0044.jpg": "e75eca5be07ff853124bdbb357926f08",
"assets/assets/images/pools/IMG-20260206-WA0004.jpg": "753524c7f7a4e5cd0bb1d72988d40c16",
"assets/assets/images/pools/IMG-20260206-WA0005.jpg": "53a8b2c6ebb02df864a8a32cc7926196",
"assets/assets/images/pools/IMG-20260206-WA0006.jpg": "60aa843bb80b1ad8376ccfe4126dac55",
"assets/assets/images/pools/IMG-20260206-WA0007.jpg": "8e8492f5708ca32e39c7a3015dcb088b",
"assets/assets/images/pools/IMG-20260206-WA0008.jpg": "0e2ac5e0b7ea041bb6e3d276418c01eb",
"assets/assets/images/pools/IMG-20260206-WA0009.jpg": "59dda35edbfdb13b5494260f09b8ed78",
"assets/assets/images/pools/IMG-20260206-WA0010.jpg": "89c5ac071e7f16e7aabb42ce6296b186",
"assets/assets/images/pools/IMG-20260206-WA0012.jpg": "b36339e26ed6b10d547d30e49719b22a",
"assets/assets/images/pools/IMG-20260206-WA0013.jpg": "e94a95db10346254f4575cb5990a726b",
"assets/assets/images/pools/IMG-20260206-WA0015.jpg": "0bdd46e5fb9e7fb0f7ae107f0cd882c8",
"assets/assets/images/pools/IMG-20260206-WA0019.jpg": "04089ed7f7fb7e572ea2f6cca41d325a",
"assets/assets/images/pools/IMG-20260206-WA0020.jpg": "65964f91e6cb8c0945a7c18ffe9d99e4",
"assets/assets/images/pools/IMG-20260206-WA0021.jpg": "5ab8c00d37380bd673b861af49f87fee",
"assets/assets/images/pools/IMG-20260206-WA0022.jpg": "ca7fa74a18c803b37dbee36d5087d4b1",
"assets/assets/images/pools/IMG-20260206-WA0023.jpg": "ecd37f42e03145847d418572b15fddfe",
"assets/assets/images/pools/IMG-20260206-WA0025.jpg": "da81abdbbe87f30fd13c490033717cfa",
"assets/assets/images/pools/IMG-20260206-WA0030.jpg": "b03c4d46a3b5348aea5117ef7cb353f6",
"assets/assets/images/pools/IMG-20260206-WA0035.jpg": "2e03193eabe8a324c27fd4de3cbf98d3",
"assets/assets/images/pools/IMG-20260206-WA0036.jpg": "23a1dc8575372fbbe142ec9879ad1cd4",
"assets/assets/images/pools/IMG-20260206-WA0039.jpg": "bf147bf4e4e3c16001f03699da57a8d2",
"assets/assets/images/pools/IMG-20260206-WA0041.jpg": "87933af0e2c292ff712fcf53799e4e74",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "3b4e70d91562aafbe1d56ded7e494964",
"assets/NOTICES": "05f87c9f93c3676e984e48312215315d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "3efc05ac747d3903db010d945d93d634",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "76216831d621634cf9cb704d286c2619",
"/": "76216831d621634cf9cb704d286c2619",
"main.dart.js": "c3524aab8a2e9a1f73726332ea31de10",
"manifest.json": "806099970054e837a609f350770cb257",
"version.json": "eae166fd7a0bb50405cd01876f7803c7"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
