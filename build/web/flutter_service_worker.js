'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "6f599bb8ec0eac83a66322b6170c4ebd",
".git/config": "4977135137de4fe91f4da829fdf4df0f",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
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
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "ebd7ed8d6dc27e725feb77248624d587",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "47296e156d5933426048c2a2da00b2f8",
".git/logs/refs/heads/master": "47296e156d5933426048c2a2da00b2f8",
".git/objects/02/bb649b1bc1346bb423cb3aa144af0907780c1d": "06a05d9ba243c48576fced5eb99bdf89",
".git/objects/04/9d59ca0f0214c7328514332b58c3dc2060413d": "7392c99f05038e6e7b2fc0ac7b523e2b",
".git/objects/08/93d212c42d726cb00cdf27536223f82e6f45f5": "79f860ce69a938f569beb21281d27b97",
".git/objects/11/b8036aebc21496ada9939aeeafdba08552003a": "3745cb1cb3183a5eafa1f40b4acb74c4",
".git/objects/11/d8cfb3c8f65a2e288ac22089b3f60aecd3945d": "380b02e97d622eb50e1a68af8258428f",
".git/objects/19/4b3ac7d24313666208175cf4b61e3e3b0bda01": "8ddad9b1aad56b678134a432376317ac",
".git/objects/1f/9dea86d49da71f095111707d03b9140eb69733": "0bd4fa0f40267bf0e6d88529e788d60b",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/25/ff4bb8e13dbca18873abc8dc12d5e5c3edebe8": "585c9c42a0267a30e5f89427e9bf4e73",
".git/objects/29/fa4512f21b61564761df5585a11be1cc985476": "decc5e942c917e8ed7ad81ac82d3f283",
".git/objects/2b/2c3a562b375d8b8666585df340e8f3868f38a8": "92a5ead6e841d0afb413c30b02850499",
".git/objects/2c/1c9a0242777de23ee2181c9c6808ff5cfefcfd": "39fe3dcf72b0cb25589347b278ab2829",
".git/objects/37/239ec94b0f507d60c9acfedc936341f1617bd0": "5d09d7364a941478429405ff44371d6b",
".git/objects/37/e63e9e884a2a55d9e1e6d0c352f45b580a5987": "769f04d0801a72a7d2970ca7bf0c4cd1",
".git/objects/43/cb6553022b20d49b0b0a68e7025e06f3a9c269": "60f03e8eaa784c0900e46e0f1f9b987d",
".git/objects/4b/1043c6d20f277cad12fa1753bbf230b3b0a8d9": "b56877f682c883a433c69acddc248ae8",
".git/objects/5e/ba35632159a5ec71de4209784afe66efa44abf": "4de5750cd6954008ba9b4896d896e440",
".git/objects/62/57454611a77bbdd3bc4a5978c83b64311d3f3e": "a5b2f5fb80c4821080a7f453759d73ff",
".git/objects/63/1faaf36bfb9209858d49da927b878fe7a5e152": "81222f5c8c573a6557876dc452650156",
".git/objects/77/26a300aa5c5d94d37622dd375ab1cfb515a381": "5189dde2b721b4d05451e025009a2c7d",
".git/objects/79/2bab4243dc0ebcdafeed26caba4be4241e9e34": "7b4471dfdc17451dbbbd72dd35a0ffb1",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/83/507da2cab1c7baa8ab76c242694a25f68441c2": "130de29defdc2a10d9cfd4e5830e8490",
".git/objects/88/a5796c795b9c62be2e1eac970c0a2d64de3c70": "03ae40777fa5a91486fcd87bee9f75be",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/f347f0eb5a6bcd6d65bcbb21fc06f0246f0557": "eb0b71277bf4752e07f9b5d392dfda31",
".git/objects/8a/fafde6a649662e31637d54d02d0834a615e7dc": "7bf0843ee42b9cc5d9c6f63909892fec",
".git/objects/95/592daa638b2436ce09bf47e8586d32796ccc19": "65f926bb24a4b3ae0f8246078bda672d",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/a3/3a55a463e4abca60aa1a9b70420c9a9a04125d": "33e2417fae44cbc11d3382067c698178",
".git/objects/a5/c2b3952cd346b7b518a9438e2e13636a8d8677": "fb819482731d5da6b0716f3f8e0b21de",
".git/objects/af/bb4c9c200533141e89ca13fbdb91ae6073f8de": "a7c18e4b7724b2775672734c27459761",
".git/objects/b4/f8d12b9b1042a3bee8a03525a30f8fca8a1009": "0144ade20af661f5681fa79d8b0c5d85",
".git/objects/b6/15dd253313096aa13ef7b076a2e5dad92b62e0": "847d6771873764abebf3c9729ffa0acd",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/cd/22076013ce8b84475eae9bb4cd6c60b5460fbe": "81c620e2d6cbe5638d6c90ee25886389",
".git/objects/d0/03a53106e1ade6309cf2760ecc84a8366cd26b": "474300794b39665fadd6d307c29e5463",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/e04c4ca3bf1f6f873c996c503edbbcddc89665": "06e3f00ecb6aa20967cab2384dcb02da",
".git/objects/de/28db843d7df6ed23b8a7526f6b6b4a83425fe7": "797e4f7b3d8dced098c51679ff33e848",
".git/objects/e5/32d73e54bf04fd217df11d8d0ba5bde56cd292": "242d15b62d6f05e2ed38abf52f8f2bae",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ef/e3b6df93ab2435b6f0bd0a1c7b17fd9a3bda49": "90a158499610ae517c97071fe7c6883c",
".git/objects/f8/c36dd8d631be6be7208c4430a3892bc4351e76": "01471de1a501e11776bfde8a2297db98",
".git/objects/fa/f54a3451aaf3593d3f8257a7d562e08ca60317": "4b7542c4cc8c158fe86e1f1d5826692a",
".git/objects/pack/tmp_pack_P28W1c": "0080a97ad5a87cddca7005b105dd063c",
".git/refs/heads/master": "1ac99317baa25567238e6faefb605887",
"assets/AssetManifest.json": "965df084feec704695dd9b3e92e70954",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/images/c1.gif": "0211ba8bc2e9caa88c556413c4766fad",
"assets/images/c1.png": "bc7dca93c1fe1613d1084b42dfad910f",
"assets/images/c2.gif": "ce626a4477ee88e334f35858f3c1002f",
"assets/images/c3.gif": "c5fa67031ca9e4013354d956f6ce2864",
"assets/images/c4.gif": "b0cc0dab39265596328185d5a4066d88",
"assets/images/idt.png": "524ca748746d93370769572c2c2cc0b1",
"assets/images/logo.png": "2e2107ac1c396e259c27a71a8ba7becb",
"assets/images/pic1.jpeg": "e4761ffe35e0b57121959c5a0e84aa0e",
"assets/NOTICES": "3fbd0fe437833406ce1e077cee982d9f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/shaders/ink_sparkle.frag": "8d40d8a1f7be16961013a141d12b0506",
"canvaskit/canvaskit.js": "9d49083c3442cfc15366562eb578b5f3",
"canvaskit/canvaskit.wasm": "e58017ff67dd1419dbd7b720458fb1af",
"canvaskit/profiling/canvaskit.js": "dfb57a8542220c772374503baaf2632c",
"canvaskit/profiling/canvaskit.wasm": "2c16ab2af3d4fbad52da379264e260e8",
"favicon.png": "2e2107ac1c396e259c27a71a8ba7becb",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "d4d1bea47a938d0583145f29c7a45c98",
"/": "d4d1bea47a938d0583145f29c7a45c98",
"main.dart.js": "177836bab80ce7f1bd2a709cec0a2cce",
"manifest.json": "d454795ec90f470ee481df70d1276310",
"version.json": "12a92ef79835b40a6093bcc932b54998"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
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
