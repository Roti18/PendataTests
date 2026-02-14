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

Gunakan format nama file `0x_nama.md` agar urutan materi terstruktur (disarankan menggunakan 2 digit):
```bash
01_pengenalan.md
02_dasar.md
10_lanjutan.md
```

## 3. BUILD
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
### Penting: Konfigurasi GitHub Pages
Agar website tampil online, pastikan pengaturan GitHub Pages di repository Anda diarahkan ke:
*   Branch: `main`
*   Folder: `/docs` (**BUKAN root `/`**)
