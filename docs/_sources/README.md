# jupyter-opz

Proyek menggunakan Jupyter Book v1.0.3. Sistem otomatis mendeteksi file baru dan mengatur sidebar berdasarkan judul H1 di dalam file.

## 1. SETUP AWAL
### Windows
```
install.bat
```
### macOS / Linux
```bash
bash ./install.sh
```

## 2. CARA PENULISAN
Setiap file baru (`.md` / `.ipynb`) **wajib** diawali judul H1 agar nama di sidebar terdeteksi otomatis:
```markdown
# Judul Materi
```

## 3. UPDATE & PUBLISH
### Windows
```
publish.bat
```
### macOS / Linux
```bash
bash ./publish.sh
```

## 4. DEPLOY
```bash
git add .
git commit -m "Update"
git push origin main
```
Pastikan GitHub Pages mengarah ke branch `main` folder `/docs`.
