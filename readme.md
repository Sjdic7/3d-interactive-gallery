# 3D Interactive Gallery 🌌

![GitHub repo size](https://img.shields.io/github/repo-size/abx15/3d-interactive-gallery)
![GitHub last commit](https://img.shields.io/github/last-commit/abx15/3d-interactive-gallery)
![GitHub issues](https://img.shields.io/github/issues/abx15/3d-interactive-gallery)
![License](https://img.shields.io/badge/license-MIT-green)

A modern, smooth, and interactive **3D gallery** built with **Three.js**, **GSAP**, and **WebGL shaders**. Features scrollable grid, hover effects, zoom, and parallax for a premium gallery experience.

---

## 🌟 Features

- 3D mesh deformation for realistic image depth
- Smooth scroll with parallax effect
- Hover effects with zoom, RGB shift & subtle animation
- Touch & mouse drag support
- Responsive design
- GPU-accelerated with vertex & fragment shaders

---

## 🛠 Tech Stack

![Three.js](https://img.shields.io/badge/Three.js-000000?style=flat-square&logo=three.js&logoColor=white)
![GSAP](https://img.shields.io/badge/GSAP-61DAFB?style=flat-square&logo=greensock&logoColor=black)
![WebGL](https://img.shields.io/badge/WebGL-000000?style=flat-square&logo=webgl&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=black)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white)

---

## 💻 Installation

1. Clone the repo:

```bash
git clone https://github.com/yourusername/3d-interactive-gallery.git
cd 3d-interactive-gallery

```

2. Install dependencies:

```bash
npm install
```
3. Run development server:

```bash
npm run dev
```
4. Open your browser: http://localhost:5173


## Example Code Snippet
```js
import { ShaderMaterial, TextureLoader } from 'three';
import vert from './shaders/gallery.vert.glsl';
import frag from './shaders/gallery.frag.glsl';

const texture = new TextureLoader().load('public/images/1.jpg');

const material = new ShaderMaterial({
  vertexShader: vert,
  fragmentShader: frag,
  uniforms: {
    uTexture: { value: texture },
    uAlpha: { value: 1 },
    uParallax: { value: new THREE.Vector2(0, 0) },
    uZoom: { value: 0.85 },
    uPlaneSizes: { value: [1, 1] },
    uImageSizes: { value: [texture.image.width, texture.image.height] },
    uHover: { value: 0 },
  },
  transparent: true
});
```

### 🎨 Customization

- **Hover Strength:** Adjust `uZoom` and `uHover` in the fragment shader to control zoom and hover intensity.  
- **Parallax Strength:** Adjust `uStrength` in the vertex shader to control 3D parallax effect.  
- **Add Images:** Place your images in `public/images` and add corresponding HTML elements with the class `gallery-grid-figure`.

---

### 🌐 Live Demo

[View Demo Here](https://yourusername.github.io/3d-interactive-gallery)

---

### ⚡ Performance Tips

- Reduce `PlaneGeometry` segments for better performance.  
- Compress images to speed up loading.  
- Optional: Disable RGB hover effect on low-end devices for smoother performance.

---

### 📜 License

MIT License — Free to use, modify, and distribute.

---


### 👨‍💻 Created By

**Arun Kumar Bind**  
Full Stack Web Developer | Frontend & WebGL Enthusiast  

- [Portfolio](https://arun15dev.netlify.app/)  
- [GitHub](https://github.com/abx15)  
- [LinkedIn](https://www.linkedin.com/in/arun-kumar-a3b047353/)  
- Email: developerarunwork@gmail.com  
- Phone: +91 9129939972  

> Made with ❤️ using **Three.js**, **GSAP**, **WebGL**, and **JavaScript**
