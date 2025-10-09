// gallery.frag.glsl
precision highp float;
precision highp int;

uniform sampler2D uTexture;
uniform float uAlpha;
uniform vec2 uParallax;
uniform float uZoom;
uniform vec2 uImageSizes;
uniform vec2 uPlaneSizes;
uniform float uHover;

varying vec2 vUv;

float exponentialInOut(float t) {
    return t == 0.0 || t == 1.0
        ? t
        : t < 0.5
            ? 0.5 * pow(2.0, (20.0 * t) - 10.0)
            : -0.5 * pow(2.0, 10.0 - (20.0 * t)) + 1.0;
}

void main() {
    // Keep aspect ratio
    vec2 ratio = vec2(
        min((uPlaneSizes.x / uPlaneSizes.y) / (uImageSizes.x / uImageSizes.y), 1.0),
        min((uPlaneSizes.y / uPlaneSizes.x) / (uImageSizes.y / uImageSizes.x), 1.0)
    );

    // Apply parallax
    vec2 uv = vec2(
        vUv.x * ratio.x + (1.0 - ratio.x) * 0.5 + uParallax.x,
        vUv.y * ratio.y + (1.0 - ratio.y) * 0.5 + uParallax.y
    );

    // Zoom effect
    vec2 zoomedUv = mix(vec2(0.5), uv, uZoom);

    // Hover effect
    float hoverLevel = exponentialInOut(min(1.0, distance(vec2(0.5), zoomedUv) * uHover + uHover));
    zoomedUv *= 1.0 - 0.2 * hoverLevel;
    zoomedUv += 0.1 * hoverLevel;
    zoomedUv = clamp(zoomedUv, 0.0, 1.0);

    vec4 color = texture2D(uTexture, zoomedUv);

    // Subtle RGB shift on hover
    if(uHover > 0.0) {
        float h = 1.0 - abs(hoverLevel - 0.5) * 2.0;
        zoomedUv.y += color.r * h * 0.05;
        color = texture2D(uTexture, zoomedUv);
        color.r = texture2D(uTexture, zoomedUv + h * 0.01).r;
        color.g = texture2D(uTexture, zoomedUv - h * 0.01).g;
    }

    gl_FragColor = mix(vec4(1.0, 1.0, 1.0, uAlpha), color, uAlpha);
}
