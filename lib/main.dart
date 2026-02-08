import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const IvatonDemoApp());
}

class IvatonDemoApp extends StatelessWidget {
  const IvatonDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HomePage()),
        GoRoute(path: '/o-nama', builder: (_, __) => const SimplePage(title: 'O Nama')),
        GoRoute(path: '/usluge', builder: (_, __) => const SimplePage(title: 'Usluge')),
        GoRoute(path: '/reference', builder: (_, __) => const SimplePage(title: 'Reference')),
        GoRoute(path: '/partneri', builder: (_, __) => const SimplePage(title: 'Partneri')),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TopContactBar(),
          const HeaderNav(),
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
    // Based ONLY on what we know from your screenshot:
    // - Phone exists
    // - Email / working hours are unknown -> do not invent them.
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xFF0B5C8E),
      ),
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
  const HeaderNav({super.key});

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
              // Replace with your logo asset later.
              const _Logo(),
              const Spacer(),
              if (!isMobile) const _DesktopNav(),
              if (isMobile) _MobileNavButton(),
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
  const _DesktopNav();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _NavLink(label: 'O Nama', path: '/o-nama'),
        _NavLink(label: 'Usluge', path: '/usluge'),
        _NavLink(label: 'Reference', path: '/reference'),
        _NavLink(label: 'Partneri', path: '/partneri'),
        _NavLink(label: 'Kontakt', path: '/kontakt'),
      ],
    );
  }
}

class _MobileNavButton extends StatelessWidget {
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
              children: const [
                _NavLink(label: 'O Nama', path: '/o-nama', isMobile: true),
                _NavLink(label: 'Usluge', path: '/usluge', isMobile: true),
                _NavLink(label: 'Reference', path: '/reference', isMobile: true),
                _NavLink(label: 'Partneri', path: '/partneri', isMobile: true),
                _NavLink(label: 'Kontakt', path: '/kontakt', isMobile: true),
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
  final String path;
  final bool isMobile;

  const _NavLink({required this.label, required this.path, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).maybePop();
        context.go(path);
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 10, vertical: 10),
        foregroundColor: Colors.black87,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(label),
      ),
    );
  }
}

/// ---------- HOME PAGE ----------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroCarousel(),
            SectionAbout(),
            SectionServices(),
            SectionProjects(),
            SectionReferences(),
            SectionPartners(),
            SectionContact(),
          ],
        ),
      ),
    );
  }
}

class HeroCarousel extends StatefulWidget {
  const HeroCarousel({super.key});

  @override
  State<HeroCarousel> createState() => _HeroCarouselState();
}

class _HeroCarouselState extends State<HeroCarousel> {
  final _controller = PageController();
  int _index = 0;

  final _images = const [
    'assets/images/hero1.jpg',
    'assets/images/hero2.jpg',
    'assets/images/hero3.jpg',
  ];

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
                        'IVATON\nIzgradnja bazena • Bazenska tehnika • Knauf',
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

class SectionAbout extends StatelessWidget {
  const SectionAbout({super.key});

  @override
  Widget build(BuildContext context) {
    // Keep this "client-safe": no invented claims beyond what we know (service keywords + location).
    return const _Section(
      title: 'O Nama',
      child: _TextBlock(
        text:
            'IVATON je građevinska tvrtka u Rovinju.\n\n'
            'Djelatnosti: izgradnja bazena, bazenska tehnika i knauf.\n\n'
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
            heading: 'KNAUF',
            items: [
              'Knauf / suha gradnja (po dogovoru)',
            ],
          ),
        ],
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

class SectionProjects extends StatelessWidget {
  const SectionProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Najnoviji Projekti',
      child: _ResponsiveGrid(
        children: List.generate(
          6,
          (i) => _CardTile(
            title: 'Projekt ${i + 1}',
            subtitle: 'Kratki opis projekta...',
          ),
        ),
      ),
    );
  }
}

class SectionReferences extends StatelessWidget {
  const SectionReferences({super.key});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Reference',
      child: _ResponsiveGrid(
        children: const [
          _CardTile(title: 'Bazeni', subtitle: 'Primjeri izvedenih bazena'),
          _CardTile(title: 'Bazenska tehnika', subtitle: 'Sustavi i oprema'),
          _CardTile(title: 'Knauf', subtitle: 'Primjeri radova'),
          _CardTile(title: 'Ostalo', subtitle: 'Dodatni projekti'),
        ],
      ),
    );
  }
}

class SectionPartners extends StatelessWidget {
  const SectionPartners({super.key});

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Partneri',
      child: _ResponsiveGrid(
        children: List.generate(
          8,
          (i) => const _PartnerLogoPlaceholder(),
        ),
      ),
    );
  }
}

class _PartnerLogoPlaceholder extends StatelessWidget {
  const _PartnerLogoPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8E8E8)),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: const Text('LOGO', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black54)),
    );
  }
}

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
          return Flex(
            direction: wide ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
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
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F9FB),
                    border: Border.all(color: const Color(0xFFE8E8E8)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // Based ONLY on screenshot:
                  // Address + phone are known; email/MB/owner/hours are unknown.
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

/// ---------- Small UI helpers ----------
class _Section extends StatelessWidget {
  final String title;
  final Widget child;

  const _Section({required this.title, required this.child});

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

class _ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  const _ResponsiveGrid({required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, c) {
        final w = c.maxWidth;
        final cols = w >= 1100 ? 4 : (w >= 800 ? 3 : (w >= 520 ? 2 : 1));
        return Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            for (final child in children)
              SizedBox(width: (w - (cols - 1) * 14) / cols, child: child),
          ],
        );
      },
    );
  }
}

class _CardTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const _CardTile({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8E8E8)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
          const SizedBox(height: 8),
          Expanded(child: Text(subtitle, style: const TextStyle(color: Colors.black54))),
          const SizedBox(height: 8),
          const Text('Detalji →', style: TextStyle(fontWeight: FontWeight.w800)),
        ],
      ),
    );
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
