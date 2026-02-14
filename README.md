# 📚 PendataTests - Jupyter Book Project

Proyek ini menggunakan **Jupyter Book v1.0.3** untuk mengelola catatan atau dokumentasi dengan format Markdown dan Jupyter Notebook.

## 🛠️ Persiapan Awal (Setup)

Jika Anda baru pertama kali mengunduh (clone) repo ini, ikuti langkah berikut:

1. **Jalankan Instalasi:**
   Double-click file `install.bat`.
   * Ini akan membuat virtual environment (`venv`).
   * Menginstall jupyter-book versi 1.0.3.
   * Menyiapkan folder awal.

## 🚀 Cara Menulis & Publish

Sistem ini sudah menggunakan fitur **Otomatis (Built-in System)**. Anda tidak perlu mengedit sidebar (`_toc.yml`) secara manual.

### 1. Tambah Materi Baru
* Letakkan file `.md` atau `.ipynb` Anda di folder utama atau di dalam folder `/md`.
* **Sangat Penting:** Berikan judul di baris pertama file Anda menggunakan format H1 (Header 1), contoh:
  ```markdown
  # Judul Materi Saya
  Isi materi di sini...
  ```

### 2. Update Website (Build)
* Double-click file **`publish.bat`**.
* Script ini akan otomatis mendeteksi file baru, mengurutkan sidebar (File tanpa angka di atas, file berangka di bawah), melakukan build, dan memindahkan hasilnya ke folder `/docs`.

### 3. Upload ke GitHub
Setelah menjalankan `publish.bat`, jalankan perintah git standar:
```bash
git add .
git commit -m "Update materi baru"
git push origin main
```

## ⚙️ Konfigurasi GitHub Pages
Agar website Anda tampil online:
1. Masuk ke **Settings** repository Anda di GitHub.
2. Pilih menu **Pages** (di sidebar kiri).
3. Pada bagian **Build and deployment**, pastikan:
   * **Source:** `Deploy from a branch`
   * **Branch:** `main` / folder **`(/docs)`**.
4. Website Anda akan tersedia di URL yang disediakan GitHub.

---
*Dibuat otomatis oleh Antigravity System.*
