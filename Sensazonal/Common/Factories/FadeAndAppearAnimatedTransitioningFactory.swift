struct FadeAndAppearAnimatedTransitioningFactory {

    static func make() -> FadeAndAppearAnimatedTransitioning {
        let presentTransition = PresentFadeAndShowTransition()
        let dismissTransition = DismissFadeAndHideTransition()
        return FadeAndAppearAnimatedTransitioning(presentTransition: presentTransition, dismissTransition: dismissTransition)
    }

}
