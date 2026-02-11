import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const IvatonDemoApp());
}

/// Global key so the header nav can scroll the HomePage from anywhere.
final GlobalKey<_HomePageState> homePageKey = GlobalKey<_HomePageState>();

enum HomeSection { top, about, services, gallery, contact }

/// ---------- IMAGE LIST (your pool folder) ----------
class PoolImages {
  static const all = [
    'assets/images/pools/IMG-20250309-WA0000.jpg',
    'assets/images/pools/IMG-20250309-WA0002.jpg',
    'assets/images/pools/IMG-20250309-WA0003.jpg',
    'assets/images/pools/IMG-20250309-WA0004.jpg',
    'assets/images/pools/IMG-20250309-WA0005.jpg',
    'assets/images/pools/IMG-20250309-WA0006.jpg',
    'assets/images/pools/IMG-20250309-WA0007.jpg',
    'assets/images/pools/IMG-20250309-WA0008.jpg',
    'assets/images/pools/IMG-20250309-WA0010.jpg',
    'assets/images/pools/IMG-20250309-WA0011.jpg',
    'assets/images/pools/IMG-20250309-WA0013.jpg',
    'assets/images/pools/IMG-20250309-WA0015.jpg',
    'assets/images/pools/IMG-20250309-WA0016.jpg',
    'assets/images/pools/IMG-20250309-WA0017.jpg',
    'assets/images/pools/IMG-20250309-WA0018.jpg',
    'assets/images/pools/IMG-20250309-WA0019.jpg',
    'assets/images/pools/IMG-20250309-WA0020.jpg',
    'assets/images/pools/IMG-20250309-WA0023.jpg',
    'assets/images/pools/IMG-20250309-WA0026.jpg',
    'assets/images/pools/IMG-20250309-WA0027.jpg',
    'assets/images/pools/IMG-20250309-WA0028.jpg',
    'assets/images/pools/IMG-20250309-WA0029.jpg',
    'assets/images/pools/IMG-20250309-WA0030.jpg',
    'assets/images/pools/IMG-20250309-WA0031.jpg',
    'assets/images/pools/IMG-20250309-WA0033.jpg',
    'assets/images/pools/IMG-20250309-WA0034.jpg',
    'assets/images/pools/IMG-20250309-WA0035.jpg',
    'assets/images/pools/IMG-20250309-WA0036.jpg',
    'assets/images/pools/IMG-20250309-WA0037.jpg',
    'assets/images/pools/IMG-20250309-WA0038.jpg',
    'assets/images/pools/IMG-20250309-WA0039.jpg',
    'assets/images/pools/IMG-20250309-WA0040.jpg',
    'assets/images/pools/IMG-20250309-WA0041.jpg',
    'assets/images/pools/IMG-20250309-WA0042.jpg',
    'assets/images/pools/IMG-20250309-WA0043.jpg',
    'assets/images/pools/IMG-20250309-WA0044.jpg',
    'assets/images/pools/IMG-20260206-WA0004.jpg',
    'assets/images/pools/IMG-20260206-WA0005.jpg',
    'assets/images/pools/IMG-20260206-WA0006.jpg',
    'assets/images/pools/IMG-20260206-WA0007.jpg',
    'assets/images/pools/IMG-20260206-WA0008.jpg',
    'assets/images/pools/IMG-20260206-WA0009.jpg',
    'assets/images/pools/IMG-20260206-WA0010.jpg',
    'assets/images/pools/IMG-20260206-WA0012.jpg',
    'assets/images/pools/IMG-20260206-WA0013.jpg',
    'assets/images/pools/IMG-20260206-WA0015.jpg',
    'assets/images/pools/IMG-20260206-WA0019.jpg',
    'assets/images/pools/IMG-20260206-WA0020.jpg',
    'assets/images/pools/IMG-20260206-WA0021.jpg',
    'assets/images/pools/IMG-20260206-WA0022.jpg',
    'assets/images/pools/IMG-20260206-WA0023.jpg',
    'assets/images/pools/IMG-20260206-WA0025.jpg',
    'assets/images/pools/IMG-20260206-WA0030.jpg',
    'assets/images/pools/IMG-20260206-WA0035.jpg',
    'assets/images/pools/IMG-20260206-WA0036.jpg',
    'assets/images/pools/IMG-20260206-WA0039.jpg',
    'assets/images/pools/IMG-20260206-WA0041.jpg',
  ];

  static List<String> random(int count) {
    final list = List<String>.from(all);
    list.shuffle(Random());
    return list.take(count.clamp(0, list.length)).toList();
  }
}

/// ---------- APP ----------
class IvatonDemoApp extends StatelessWidget {
  const IvatonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            final target = state.extra is HomeSection ? state.extra as HomeSection : null;
            return HomePage(key: homePageKey, initialScrollTo: target);
          },
        ),
        // You can keep these routes or remove them. Menu now scrolls the homepage.
        GoRoute(path: '/o-nama', builder: (_, __) => const SimplePage(title: 'O Nama')),
        GoRoute(path: '/usluge', builder: (_, __) => const SimplePage(title: 'Usluge')),
        GoRoute(path: '/kontakt', builder: (_, __) => const SimplePage(title: 'Kontakt')),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'IVATON Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0B5C8E)),
        textTheme: GoogleFonts.montserratTextTheme(),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;
  const SimplePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    );
  }
}

/// ---------- Shared scaffold (top bar + header/nav + footer) ----------
class SiteScaffold extends StatelessWidget {
  final Widget body;
  const SiteScaffold({super.key, required this.body});

  void _handleNav(BuildContext context, HomeSection section) {
    final router = GoRouter.of(context);
    final location = router.routerDelegate.currentConfiguration.uri.toString();

    if (location == '/') {
      homePageKey.currentState?.scrollTo(section);
    } else {
      context.go('/', extra: section);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TopContactBar(),
          HeaderNav(onNav: (section) => _handleNav(context, section)),
          Expanded(child: body),
          const Footer(),
        ],
      ),
    );
  }
}

class TopContactBar extends StatelessWidget {
  const TopContactBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: const BoxDecoration(color: Color(0xFF0B5C8E)),
      child: const Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 8,
        children: [
          _TopBarItem(text: 'Telefon: 099 799 9732'),
          _TopBarItem(text: 'Rovinj, Hrvatska'),
        ],
      ),
    );
  }
}

class _TopBarItem extends StatelessWidget {
  final String text;
  const _TopBarItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
    );
  }
}

class HeaderNav extends StatelessWidget {
  final void Function(HomeSection section) onNav;
  const HeaderNav({super.key, required this.onNav});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE8E8E8))),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Row(
            children: [
              const _Logo(),
              const Spacer(),
              if (!isMobile) _DesktopNav(onNav: onNav),
              if (isMobile) _MobileNavButton(onNav: onNav),
            ],
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF0B5C8E),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: const Text('I', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
        ),
        const SizedBox(width: 10),
        Text(
          'IVATON',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}

class _DesktopNav extends StatelessWidget {
  final void Function(HomeSection section) onNav;
  const _DesktopNav({required this.onNav});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _NavLink(label: 'O Nama', onTap: () => onNav(HomeSection.about)),
        _NavLink(label: 'Usluge', onTap: () => onNav(HomeSection.services)),
        _NavLink(label: 'Galerija', onTap: () => onNav(HomeSection.gallery)),
        _NavLink(label: 'Kontakt', onTap: () => onNav(HomeSection.contact)),
      ],
    );
  }
}

class _MobileNavButton extends StatelessWidget {
  final void Function(HomeSection section) onNav;
  const _MobileNavButton({required this.onNav});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: 'Menu',
      onPressed: () => showModalBottomSheet(
        context: context,
        showDragHandle: true,
        builder: (_) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavLink(label: 'O Nama', isMobile: true, onTap: () => onNav(HomeSection.about)),
                _NavLink(label: 'Usluge', isMobile: true, onTap: () => onNav(HomeSection.services)),
                _NavLink(label: 'Galerija', isMobile: true, onTap: () => onNav(HomeSection.gallery)),
                _NavLink(label: 'Kontakt', isMobile: true, onTap: () => onNav(HomeSection.contact)),
              ],
            ),
          ),
        ),
      ),
      icon: const Icon(Icons.menu),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isMobile;

  const _NavLink({required this.label, required this.onTap, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).maybePop();
        onTap();
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 10, vertical: 10),
        foregroundColor: Colors.black87,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
      child: Align(alignment: Alignment.centerLeft, child: Text(label)),
    );
  }
}

/// ---------- HOME PAGE ----------
class HomePage extends StatefulWidget {
  final HomeSection? initialScrollTo;
  const HomePage({super.key, this.initialScrollTo});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTop = false;

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final shouldShow = _scrollController.offset > 450;
      if (shouldShow != _showBackToTop) setState(() => _showBackToTop = shouldShow);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final target = widget.initialScrollTo;
      if (target != null && target != HomeSection.top) scrollTo(target);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollTo(HomeSection section) {
    final ctx = switch (section) {
      HomeSection.about => _aboutKey.currentContext,
      HomeSection.services => _servicesKey.currentContext,
      HomeSection.gallery => _galleryKey.currentContext,
      HomeSection.contact => _contactKey.currentContext,
      HomeSection.top => null,
    };

    if (section == HomeSection.top || ctx == null) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
      );
      return;
    }

    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeOutCubic,
      alignment: 0.08,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const HeroCarousel(),
                SectionAbout(key: _aboutKey),
                SectionServices(key: _servicesKey),
                SectionGallery(key: _galleryKey),
                SectionContact(key: _contactKey),
              ],
            ),
          ),
          if (_showBackToTop)
            Positioned(
              right: 18,
              bottom: 18,
              child: FloatingActionButton(
                onPressed: () => scrollTo(HomeSection.top),
                child: const Icon(Icons.keyboard_arrow_up),
              ),
            ),
        ],
      ),
    );
  }
}

/// ---------- HERO (3 random images from pools) ----------
class HeroCarousel extends StatefulWidget {
  const HeroCarousel({super.key});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  final _controller = PageController();
  int _index = 0;

  late final List<String> _images;

  @override
  void initState() {
    super.initState();
    _images = PoolImages.random(3);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (i) => setState(() => _index = i),
            itemCount: _images.length,
            itemBuilder: (_, i) => _HeroSlide(imageAsset: _images[i]),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1180),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 72),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.45),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'IVATON\nIzgradnja bazena • Bazenska tehnika • Manji građevinski radovi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w800,
                          height: 1.15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 0,
            bottom: 0,
            child: IconButton(
              onPressed: () => _controller.previousPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
              ),
              icon: const Icon(Icons.chevron_left, size: 34, color: Colors.white),
            ),
          ),
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: IconButton(
              onPressed: () => _controller.nextPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOut,
              ),
              icon: const Icon(Icons.chevron_right, size: 34, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 18,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                (i) => Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: i == _index ? Colors.white : Colors.white.withValues(alpha: 0.45),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _HeroSlide extends StatelessWidget {
  final String imageAsset;
  const _HeroSlide({required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(imageAsset, fit: BoxFit.cover),
        Container(color: Colors.black.withValues(alpha: 0.25)),
      ],
    );
  }
}

/// ---------- SECTIONS ----------
class SectionAbout extends StatelessWidget {
  const SectionAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Section(
      title: 'O Nama',
      child: _TextBlock(
        text: 'IVATON je građevinska tvrtka u Rovinju.\n\n'
            'Djelatnosti: izgradnja bazena, bazenska tehnika i manji građevinski radovi.\n\n'
            'Za više informacija i upite slobodno nas kontaktirajte.',
      ),
    );
  }
}

class SectionServices extends StatelessWidget {
  const SectionServices({super.key});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Usluge',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _ServiceGroup(
            heading: 'IZGRADNJA BAZENA',
            items: [
              'Projektiranje i izgradnja bazena',
              'Ugradnja i montaža bazenske opreme',
              'Servis i održavanje bazena (po dogovoru)',
            ],
          ),
          SizedBox(height: 18),
          _ServiceGroup(
            heading: 'BAZENSKA TEHNIKA',
            items: [
              'Tehnička rješenja i oprema za bazene',
              'Savjetovanje i priprema sustava (po dogovoru)',
            ],
          ),
          SizedBox(height: 18),
          _ServiceGroup(
            heading: 'Manji građevinski radovi',
            items: [
              'Manji građevinski zahvati i popravci (po dogovoru)',
              'Završni radovi i sitne adaptacije (po dogovoru)',
              'Sanacije i popravci po potrebi (po dogovoru)',
            ],
          ),
        ],
      ),
    );
  }
}

/// ---------- GALLERY (fixed height + left/right buttons + random order) ----------
class SectionGallery extends StatefulWidget {
  const SectionGallery({super.key});

  @override
  State<SectionGallery> createState() => _SectionGalleryState();
}

class _SectionGalleryState extends State<SectionGallery> {
  late final List<String> _images;
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _images = List<String>.from(PoolImages.all)..shuffle(Random());
    _controller = PageController(viewportFraction: 0.82);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _prev() {
    _controller.previousPage(duration: const Duration(milliseconds: 350), curve: Curves.easeOutCubic);
  }

  void _next() {
    _controller.nextPage(duration: const Duration(milliseconds: 350), curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Galerija',
      child: SizedBox(
        height: 360,
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: _images.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      _images[i],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            Positioned(
              left: 6,
              top: 0,
              bottom: 0,
              child: _GalleryArrowButton(icon: Icons.chevron_left, onTap: _prev),
            ),
            Positioned(
              right: 6,
              top: 0,
              bottom: 0,
              child: _GalleryArrowButton(icon: Icons.chevron_right, onTap: _next),
            ),
          ],
        ),
      ),
    );
  }
}

class _GalleryArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _GalleryArrowButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.white.withValues(alpha: 0.85),
        shape: const CircleBorder(),
        elevation: 2,
        child: IconButton(
          icon: Icon(icon, size: 36),
          onPressed: onTap,
          tooltip: 'Scroll',
        ),
      ),
    );
  }
}

/// ---------- CONTACT (keeps input fields + text) ----------
class SectionContact extends StatefulWidget {
  const SectionContact({super.key});

  @override
  State<SectionContact> createState() => _SectionContactState();
}

class _SectionContactState extends State<SectionContact> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Kontakt',
      child: LayoutBuilder(
        builder: (context, c) {
          final wide = c.maxWidth >= 900;

          // IMPORTANT: inside scroll view -> avoid Expanded (unbounded height).
          // Use Flexible(fit: FlexFit.loose) + IntrinsicHeight so it lays out correctly.
          return IntrinsicHeight(
            child: Flex(
              direction: wide ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Kontaktirajte nas!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                      const SizedBox(height: 12),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _field(label: 'Ime *'),
                            _field(label: 'E-Mail *'),
                            _field(label: 'Predmet *'),
                            _field(label: 'Poruka *', maxLines: 5),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Checkbox(value: true, onChanged: (_) {}),
                                const Expanded(
                                  child: Text(
                                    'Prihvaćam da se moji podaci koriste za kontaktiranje u svrhu mojeg upita.',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: FilledButton(
                                onPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Demo: forma poslana (nije spojeno na backend).')),
                                    );
                                  }
                                },
                                child: const Text('Pošalji'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: wide ? 24 : 0, height: wide ? 0 : 24),
                Flexible(
                  fit: FlexFit.loose,
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F9FB),
                      border: Border.all(color: const Color(0xFFE8E8E8)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Kontakt informacije', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                        SizedBox(height: 12),
                        Text('IVATON (Izgradnja bazena | bazenska tehnika | knauf)'),
                        SizedBox(height: 6),
                        Text('Građevinska tvrtka u Rovinju'),
                        SizedBox(height: 12),
                        Text('Adresa: Madonna di Campo 1z-1, 52210 Rovinj'),
                        SizedBox(height: 6),
                        Text('Telefon: 099 799 9732'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _field({required String label, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (v) {
          if (label.contains('*') && (v == null || v.trim().isEmpty)) {
            return 'Obavezno polje';
          }
          return null;
        },
      ),
    );
  }
}

class _ServiceGroup extends StatelessWidget {
  final String heading;
  final List<String> items;

  const _ServiceGroup({required this.heading, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(heading, style: const TextStyle(fontWeight: FontWeight.w900)),
        const SizedBox(height: 10),
        ...items.map(
          (t) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  ', style: TextStyle(fontWeight: FontWeight.w800)),
                Expanded(child: Text(t)),
              ],
            ),
          ),
        )
      ],
    );
  }
}

/// ---------- Small UI helpers ----------
class _Section extends StatelessWidget {
  final String title;
  final Widget child;

  const _Section({required this.title, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 44),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
              const SizedBox(height: 18),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class _TextBlock extends StatelessWidget {
  final String text;
  const _TextBlock({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(height: 1.55));
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: const BoxDecoration(
        color: Color(0xFFF2F4F6),
        border: Border(top: BorderSide(color: Color(0xFFE8E8E8))),
      ),
      child: const Center(
        child: Text('© IVATON — demo web stranica'),
      ),
    );
  }
}
