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
"index.html": "968ea570e75034288bd712188679791b",
"/": "968ea570e75034288bd712188679791b",
"main.dart.js": "691d8155c46b4c6423956144d8b4deb2",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "b4126bff337ad0f4520998229064e00c",
"icons/Icon-192.png": "0dbebe0993612c266b8748b5450676f8",
"icons/Icon-maskable-192.png": "0dbebe0993612c266b8748b5450676f8",
"icons/Icon-maskable-512.png": "eb2bdcce6fc140a31876d19a05513d7a",
"icons/Icon-512.png": "eb2bdcce6fc140a31876d19a05513d7a",
"manifest.json": "abd592871065844513e44a73c9625a2b",
".git/config": "4fb62e734c3e5ab5f8691795146a7db5",
".git/objects/0d/d64c285888e0e8bfb23278b475f4726771910b": "10095de6d45b832d55e217dd20875096",
".git/objects/0c/bca88584fa4b9cc07332a5a73123b58b5e4cae": "53e509d54b290456fd48887874ea0109",
".git/objects/3e/ee2d5e955f3fd670eeb7e2aca383807ea82f95": "86cc4a5a7c50840e9f660879af90ac47",
".git/objects/50/5beb3769da4fb2c0b782039a138b5f96ca4cc7": "997e1fb16757c536046335bb7e2c99bc",
".git/objects/3b/046a2351cd15b8649957a4bf2d13292f9307ec": "bf4b4510df55ee97e3071fd062339ed5",
".git/objects/3b/85ea5bb5bb311a9457c3f41e03e400be1d019a": "d6146f4e4711c8d0923643c4f6ac8bd8",
".git/objects/6f/d4909927645e39d4f1ddc4be2436c7f4368c37": "25a942ce3473214190244ed4c92bc9a8",
".git/objects/03/346231bbe03ec9286f7b60db415c021b45b9f2": "c97aa8b5e4976463168d8ea681a2ea02",
".git/objects/04/a3b716d111df636c4bc2681e4b6d9489563d0b": "269c3bbe2be12489c05a54636db8d988",
".git/objects/04/e5efc15dc0c60ea2ffcc37c5bf25e96689f44d": "a38b659be46000ea380d44aac5f1eaf0",
".git/objects/69/6c01eded52a8f733be2ceaa5ed920abc39783b": "209f65acebe595f002102a0e711bc17b",
".git/objects/58/5320716e5ea55a7d78479357f972621820faa0": "bb938103d4e94248c63d3e909b1913fb",
".git/objects/94/b52e13bf7919ae4ea7235d78019b592dde8611": "3e3ebc72e8b28f62e31bcafb5b583c99",
".git/objects/0e/e3590f4d74c3a4e4621a8d048d01f13436ec7a": "bbe0720303d15773ba7af8e43658ece5",
".git/objects/05/b27b93246a2a7ece1a373b6ca6d06191d509e9": "6639ca6c08a483eadfa87921228cb63c",
".git/objects/a4/dedbe7115ae6d9f60fb6e160d31342721cf294": "91934bf34ee3616f760e30014eed8dd9",
".git/objects/a4/30429315bac5767862220207279f249f635a42": "d7e1d92192aa919acd81a1dbfcc3616f",
".git/objects/ac/11be4df10af2c7b086c5058d6092396a7a023e": "77eb78da41060c8621135a255a1656a8",
".git/objects/ad/bf07417d73eb6ea693c5341ed4365ce80713c5": "150968e0039719562e24da313210fcdd",
".git/objects/bb/7b71608fad7a7a9a6a00783aa8123c24dc76e1": "83b14402a2188852480b10d572030536",
".git/objects/bb/3085876799532613a08c7ebe43f24f0cc46864": "e2e9b8a00fbb9a9387e9f654f6d27c73",
".git/objects/d7/2c11112c7cb4e2ce754bc41470f9b829a2d00a": "1020ea7c17300eba0f2921dfe6fff24e",
".git/objects/d0/eb592064c0d5c3dfc557c22150372056bcc5de": "b1eb4361a2a92cf5243b9668eaffccb6",
".git/objects/a5/0cd8baaa8f85b37bdaa7885406751b6ee0be17": "afb4fa4b7b7308217e18a8a6683dac0a",
".git/objects/ae/f84167e45f97c2e5ae1a18dcf6fc68bae48960": "81bf1ff6986ce44a27896737299576c2",
".git/objects/eb/c8b611a223d47cf95dc6b3c1491a9e2ca45b4c": "bd79ec477775d59af0f400d579ad2e82",
".git/objects/c9/84dbbfd9a5a65215a52165b9e7502a632b553f": "df7cafe515fe0c3e07458f45dee43606",
".git/objects/fd/d400d94beba02fc66e127d3170d65fcb6f7aec": "e7ebac6e9a7c49d5ae5054d57943e898",
".git/objects/fe/5ec042e887752677214b8d1147b6b71c47c264": "2acfe1c7ff949c24f03bb3bc3037879d",
".git/objects/fe/5b431ae486baac22ba674b648c008a1a4227d2": "abe5353cb2b27353c5bc6deb35afaced",
".git/objects/c8/0fcc897321fd060fba7c375441cd745ae971b4": "4f6575833077be36a4cd93e94f6bfe5e",
".git/objects/fb/a3dd6fefac53f0caeedb880ef495686e9e8427": "d06006579b622aab49a1f37151dfd4da",
".git/objects/ed/c152875aaf6ff05c5a4ad0e797f632b9a545b9": "283842954ed977623912943d4ca0792f",
".git/objects/ec/77327f395d2e377add81ef07c4bde505f9b8df": "c1cec890aebe96ba2988b58dcb90ddec",
".git/objects/4e/133da1405a286f31daab71cfad3159c60a0367": "094a6064e2c24531c75939ba6c30b9a8",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "19044025d8304d81100c4e12af0ce161",
".git/objects/18/77283aa52b37312f316793619c1683c6a28714": "13afa5606aaa44b40c71f680ffcb8e2d",
".git/objects/4b/08c92a6448f807045994c6de22d8ee9093aaab": "16a4745f56131e968fc48919a6d23747",
".git/objects/29/3d841da107e9bf0fbeac8b3095a94ace7d260e": "8c829b61b9d8f4bf986916f49a047f63",
".git/objects/7c/ee941f31a75d001e71b4d366bcbfa3863c818f": "4d4bbb29d66795985b370584af510bdc",
".git/objects/42/a70451320d264d64eea7d57f4ca951e6fd57fe": "32880cc2f739f6ad4d793fe97cf82491",
".git/objects/42/db69e6636c20c8cfde60bfbdb841a2e76b75ea": "c8632640108270326e40b39116a514a6",
".git/objects/45/d5285bf3b0b5026ebd191f3172d14c62c37029": "bb9e453ebbae6287e89bce2d51af55c8",
".git/objects/1f/608d6c43e5fed31649a5ca59c6540957d4e6b3": "cb5d66811f8c5f3310aea6f662a57b1f",
".git/objects/87/33c36a2b21a13e419d0c24ab1e578869f61074": "ac03fc4035a3c65e84cd62657f8069ff",
".git/objects/80/69a359de1a762b6dfa1fbf4eee1a0c4ec98110": "480b1a520c213261966047ed748dcb21",
".git/objects/1a/90e617803c59b1d13cf48a6dd545bd7bab958e": "b3904ea1c9f5b377989d1d03cbf118f2",
".git/objects/7b/9ee1de2e3515a9edea614910fd387ff0d1de44": "996ba75f81c45399eccf3c88e1501830",
".git/objects/8a/0e8c5af705183587f95cedf04765fe378f517a": "cba51d01f81ed2bc76a2ef2bae76851f",
".git/objects/8a/d41123112dcc05e645c65693277074ac106233": "06371b4c846a524d0ea81db521117644",
".git/objects/19/6526e0ebe0691fa72ced10500df689aaa66d77": "de0be4c89c6cfa16ac118f48288aba91",
".git/objects/4c/9ce11d4642c53ba237091c84b73e7ee5e67188": "9e2cdcf0ecc5dadbb1384ed9473a55b3",
".git/objects/21/0597bdc0917689cd5fa7674f6070b9765f089b": "b45832da5a5833bae6d4dd3a74c0a4cc",
".git/objects/75/30511601ad551567c43699eeef53339ca720d1": "5062d5cd1652398dc16820066a84128e",
".git/objects/72/7598816742a69f7e1426500d5ebcaffbc0c259": "ece1eb41a844c3b67564f1854a3a9630",
".git/objects/43/e946e398d96aee466fa0aabb625f0889c3a4bd": "4b20de063f6c0fa780d5edb1fa8c9050",
".git/objects/88/a58761d55ab4a151640f8453651fabf13aa686": "bfd66b50ca97c5c7eb55c14663e0f708",
".git/objects/9f/c8afd5215b872f8c52ab8fe300db7d37e602d1": "a70c28cee3f103abde793f3dd188e9e5",
".git/objects/5c/c6b490a6d2abcb3104cd22d8091b93110b3719": "2977f77ac747a1a8b94fc25701ef1e80",
".git/objects/31/723735c20cd166c5a83bd72c67566a1c5f4b87": "61423f161c7ad3ba9cc008c9c504cdf4",
".git/objects/54/f1c3ca99753ef70825f49fc42530ba959b6ef8": "9d3a231c00e0888ac22c5538d75de985",
".git/objects/53/7807567919e88db2866b7825339c57e94c24d8": "98dc92399f0c19aa26b49bce570be57e",
".git/objects/37/21ff64034cda4d0ee4f8c1f941155b602951c8": "2ccbdad9fd8db9a8b646cc79869eb0bd",
".git/objects/01/dde3a281076ca969a79a3c2dcecb86c0e1cde2": "f5fa4e4aee26caec734c5295964aafb4",
".git/objects/06/18e1f3f45067ef9bd92742f5b1c5426d65f65e": "857ae6bf9cc27c7589fa35afdbe7ce43",
".git/objects/39/e074ddebcc47bf268771d7b5ca905611aa7018": "a21dbc81a7574adc53b5bfed669c2a06",
".git/objects/55/9893b19dcfc4b16aeb04aa9ad4209013825e24": "c38af895a07550a1364ed984c662acc0",
".git/objects/97/24698ad7fa73a8520596160fece7d4e5fea955": "2e092333c6cec07fb3bbb83d900feaed",
".git/objects/0a/1286d9b580d35af1d35307b02fef88cadea24e": "87a6c8357a675b551369a310922fc63f",
".git/objects/64/80d48d781969a328b919d09f1dd56b4f598b6e": "9afe598ecb31c41ed8bf42e7b7d4d6ae",
".git/objects/64/3d7d4cf958298065a5d6fdbc25fef8f4fdf94e": "d40f155886ae0b3949477687d79e9566",
".git/objects/90/7a64e983e3e3530cbcfb4f69d4e3bdcdc20c46": "ced230a2363f1c07325c9be3ccaa8252",
".git/objects/bf/e49fa39261e7516e5df18bbd72869e4ab38d22": "443f4a247fc116275331135986124a00",
".git/objects/d3/3f1ac37c3fba6cae534095b3ef74131184f3aa": "f51a47a6f78fda9158c6df14022f8166",
".git/objects/ba/8cb00dd5231f1a55de0205c16445926a696526": "82e60b57d446e81a904371b9bf223991",
".git/objects/dc/508baf399cfbea32f51b9542fe69f91cfae884": "32bd74a0b35702588e7b68155321149b",
".git/objects/b6/256c66cac4e04a50b0887174489d08196e8248": "27db037e6cb035249b25774d9955e6d3",
".git/objects/db/5f3744d46da2bf955f7eb05a6a2f36f0eb0aa7": "2594e7e3eca5bc8f9253abf06bc744be",
".git/objects/a1/376d6e035d29157bcf3e1ff8e82157dc03f35b": "6e82ae196bbd50a5287cfdadd0d777af",
".git/objects/c4/3f433a27ab25eaffef67626cdd2946616f3860": "4a3320b2d26b17c7c913f06ffbe3de7a",
".git/objects/cc/03cd0ca1ceb71db5c5c5495895535de2dbf0af": "ab1b2be027fd87779b06ccfb03b1e703",
".git/objects/e6/b745f90f2a4d1ee873fc396496c110db8ff0f3": "6078dfba0d9dfa654b1e692f5dc30d82",
".git/objects/f0/138c6d39dc6686fb9be89e53e6d4270319c710": "d2a0dc22333a558d9faa38688c2da17d",
".git/objects/f0/ec80a5e09cea69d01d4559486991941b496c8b": "85f6373b835cbfe338a62043d4d59fd0",
".git/objects/e8/0bed47575e3acf9654ff2f6335e176c304d02b": "85e4dbc9f04d8d9160a58132b1948d6f",
".git/objects/fa/81d0cc454e3cb76ad2b16e97d09d6e390c48ba": "63efd610466282d02b1448b8b8c8ee54",
".git/objects/f1/110f7f9a7e22e9a9c651e257b2114f030113a2": "2b545bede43ddc6c15cc2e61236a3853",
".git/objects/cb/1fbbbd24a2e51fe297fae5079b2f660246cd8f": "cbb57424b695dcdbe0825721531d196b",
".git/objects/cb/9d1cf400840ff82869c5584c11f9bf66866a03": "666e0cf75f1415a874191a3783bdfd71",
".git/objects/f8/dd2dcd71f3350cc161efd3c6f13b9a979ca2e4": "084a7af0f63a79f94cc754b8380ae6ad",
".git/objects/2c/c28264fdefeb27e2776562ef81aee666cafb7c": "5d987c086cfd642239bdf6bbb2394c17",
".git/objects/83/2d91067f180049e6f7910180ad8f4d1f30d332": "dd7b11cf9ee48a1236fd114068e5071b",
".git/objects/83/80746b07cb7e74ef4a8386522e9c446ab89895": "f15514dc2e3df9db49e3d45c4038b251",
".git/objects/83/f95467f9828ac012641d1e6d3c430dc8f8a624": "87159665e7e7478109901f80335f8b94",
".git/objects/77/aac4aaa3d3d393b3baa49399f6716796933186": "c84e8f8b2d6252f8a0c01885d3a011ca",
".git/objects/48/33fcf9ba677d3df448c90e63368e50f8bfc8d6": "1860c7a17ce6c917f182cc975a6614c1",
".git/objects/48/9d643656ce1ad4902e84d063913949eb1ba3e7": "21b56dc2af5f3b8adc7019d429543ac2",
".git/objects/70/948f81140974753c66ea49eb17bfb4bbe60aab": "85c9b409e3bc723b71d35e06683f2a0e",
".git/objects/23/5574292867daab13eda700a2c6fa7578912915": "b8185f83afb446aab5e120ac21d10a2f",
".git/objects/4f/d0e51f345ee398d4c56c9a2a36514cfdc54f3e": "4e4c98dc570eb3fcba8546031713e11d",
".git/objects/8d/32236936652ef7dfed65fe592a171f401f0651": "3956bfdfc563aaa77dedb799b92b52d0",
".git/objects/15/742c831bfc4f949c11791bd7c13bae2d5b567e": "60cf7fdd0c6109bef8d69e8573e185ed",
".git/objects/12/2717ba52a05abd2ad30e1f7e46baa9c8f10bc2": "f96252f7e0a012929bda0a9a968a1c14",
".git/objects/71/e105bd18db18084776ca995165fef2c8a190b8": "56b296a3883078c98107f295d27cd6d6",
".git/objects/76/c78356df9ad5ef5da5f915346fb495ef8d9e71": "6031271300859f3a00a1b0d82874ab90",
".git/objects/49/149bf3fa0c9cca8ce896d7835b3e2996675ab3": "f2102e5ddfe65fa61992b9a4cf4ea475",
".git/objects/2b/e39c7fd3da441ddac9bea54fd12621dd39960a": "1492b21349508efe401533aa1db33615",
".git/objects/47/2043032ce297202a15eb136c0fec38a380fdca": "e6ead648d88ab9b575e75c7880c64fc4",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "a8a51798cbae29ecadb4382881ffc254",
".git/logs/refs/heads/gh-pages": "a8a51798cbae29ecadb4382881ffc254",
".git/logs/refs/remotes/origin/gh-pages": "33c1fea27d48f1501584f43a72cef621",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "d2e5492b2d25fd006a41fff5aa90e47b",
".git/refs/remotes/origin/gh-pages": "d2e5492b2d25fd006a41fff5aa90e47b",
".git/index": "21fb79454ee1b9d1f878ec308458aba5",
".git/COMMIT_EDITMSG": "01eb2c11c2685e04a0e3b0556549b914",
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
