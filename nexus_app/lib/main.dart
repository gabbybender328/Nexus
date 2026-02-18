import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nexus Landing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050505),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00F0FF), // Neon Cyan
          secondary: Color(0xFF7000FF), // Neon Purple
          tertiary: Color(0xFFFF0055), // Neon Pink
          surface: Color(0xFF121212),
        ),
        textTheme: GoogleFonts.spaceGroteskTextTheme(
          ThemeData.dark().textTheme.apply(
                bodyColor: Colors.white.withOpacity(0.9),
                displayColor: Colors.white,
              ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50 && !_isScrolled) {
        setState(() => _isScrolled = true);
      } else if (_scrollController.offset <= 50 && _isScrolled) {
        setState(() => _isScrolled = false);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AnimatedContainer(
          duration: 300.ms,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          color: _isScrolled
              ? Colors.black.withOpacity(0.8)
              : Colors.transparent,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: _isScrolled ? 10 : 0,
                sigmaY: _isScrolled ? 10 : 0,
              ),
              child: Row(
                children: [
                  const Text(
                    "NEXUS",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ).animate().fadeIn(duration: 600.ms).slideX(),
                  const Spacer(),
                  if (MediaQuery.of(context).size.width > 700) ...[
                    _NavButton(title: "Features"),
                    _NavButton(title: "Pricing"),
                    _NavButton(title: "About"),
                    const SizedBox(width: 20),
                  ],
                  _GradientButton(
                    text: "Get Started",
                    onPressed: () {},
                  ).animate().scale(delay: 500.ms, duration: 300.ms),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const _HeroSection(),
            const _FeaturesSection(),
            const _ShowcaseSection(),
            const _TestimonialSection(),
            const _FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(
                  duration: 4.seconds,
                  begin: const Offset(1, 1),
                  end: const Offset(1.2, 1.2),
                ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Theme.of(context).colorScheme.secondary.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(
                  duration: 5.seconds,
                  begin: const Offset(1, 1),
                  end: const Offset(1.3, 1.3),
                  delay: 1.seconds,
                ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                    ),
                    child: Text(
                      "NEXT GEN PLATFORM",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 200.ms)
                      .moveY(begin: 20, end: 0),
                  const SizedBox(height: 24),
                  Text(
                    "Future of Digital\nExperience",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width > 700 ? 72 : 48,
                      fontWeight: FontWeight.w900,
                      height: 1.1,
                      letterSpacing: -2,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 400.ms)
                      .moveY(begin: 30, end: 0)
                      .shimmer(duration: 2.seconds, delay: 1200.ms),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 600),
                    child: Text(
                      "Create stunning web experiences with our advanced toolkit designed for speed, security, and scalability.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 600.ms)
                      .moveY(begin: 30, end: 0),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _GradientButton(
                        text: "Start Building",
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 20),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 20),
                        ),
                        child: const Row(
                          children: [
                            Text("Learn More"),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 16),
                          ],
                        ),
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(duration: 800.ms, delay: 800.ms)
                      .moveY(begin: 40, end: 0),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white54,
                size: 32,
              ).animate(onPlay: (c) => c.repeat()).moveY(
                  begin: 0, end: 10, duration: 1.seconds, curve: Curves.easeInOut),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Column(
        children: [
          const Text(
            "Powerful Features",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _FeatureCard(
                icon: Icons.speed,
                title: "Blazing Fast",
                description:
                    "Optimized for performance with zero-runtime overhead.",
                color: Theme.of(context).colorScheme.primary,
              ),
              _FeatureCard(
                icon: Icons.security,
                title: "Bank-Grade Security",
                description: "Enterprise-ready protection for your data.",
                color: Theme.of(context).colorScheme.secondary,
              ),
              _FeatureCard(
                icon: Icons.all_inclusive,
                title: "Infinite Scale",
                description: "Grow without limits using our cloud infrastructure.",
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        width: 350,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered ? widget.color : Colors.white10,
            width: 1.5,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: widget.color.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
          ],
        ),
        transform: Matrix4.translationValues(0, _isHovered ? -10 : 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icon, color: widget.color, size: 32),
            ),
            const SizedBox(height: 24),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: const TextStyle(
                color: Colors.white60,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  const _ShowcaseSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100),
      color: const Color(0xFF0F0F0F),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Built for\nCreators",
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                height: 1.1,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 400,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (_, _) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                return _ShowcaseCard(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ShowcaseCard extends StatelessWidget {
  final int index;
  const _ShowcaseCard({required this.index});

  @override
  Widget build(BuildContext context) {
    const colors = [
      Colors.blueAccent,
      Colors.orangeAccent,
      Colors.purpleAccent,
      Colors.greenAccent,
    ];
    
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: colors[index % colors.length].withOpacity(0.2),
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 64,
                  color: colors[index % colors.length],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Project ${index + 1}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "A brief description of this amazing project goes here.",
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate(delay: (index * 100).ms).fadeIn().slideX(begin: 0.2, end: 0);
  }
}

class _TestimonialSection extends StatelessWidget {
  const _TestimonialSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Column(
        children: [
          const Text(
            "Trusted by Developers",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  Colors.transparent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white10),
            ),
            child: Column(
              children: [
                const Icon(Icons.format_quote, size: 48, color: Colors.white24),
                const SizedBox(height: 24),
                const Text(
                  "Nexus transformed the way we build interfaces. The components are intuitive, the animations are smooth, and the performance is unmatched. Highly recommended!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, height: 1.5),
                ),
                const SizedBox(height: 32),
                const CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Sarah Jenkins",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "CTO at TechCorp",
                  style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.black,
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "NEXUS",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _FooterLink("Twitter"),
              const SizedBox(width: 24),
              const _FooterLink("GitHub"),
              const SizedBox(width: 24),
              const _FooterLink("Discord"),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            "© 2024 Nexus Inc. All rights reserved.",
            style: TextStyle(color: Colors.white.withOpacity(0.2), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink(this.text);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(text, style: const TextStyle(color: Colors.white54)),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String title;
  const _NavButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
      child: Text(title),
    );
  }
}

class _GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;

  const _GradientButton({
    required this.text,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
