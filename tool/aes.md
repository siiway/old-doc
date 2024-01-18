# AES 加/解密

---

<style>
    .form-group {
      margin-bottom: 10px;
    }

    label {
      display: inline-block;
      width: 100px;
    }

    input[type="password"],
    input[type="text"],
    textarea {
      width: 250px;
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }

    button {
      padding: 5px 10px;
      background-color: #1e90ff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    button:hover {
      background-color: #6495ed;
    }

    textarea {
      min-height: 100px;
    }
    </style>

  <div class="form-group">
    <label for="encryptionKey">密钥：</label>
    <input type="password" id="encryptionKey">
  </div>

---

  <div class="form-group">
    <label for="plaintext">明文：</label>
    <textarea id="plaintext"></textarea>
  </div>

  <div class="form-group">
    <label for="ciphertext">密文：</label>
    <textarea id="ciphertext"></textarea>
  </div>

---

  <div class="form-group">
    <button onclick="encrypt()">加密</button>
    <button onclick="decrypt()">解密</button>
  </div>

  <script>
    function encrypt() {
      var encryptionKey = document.getElementById('encryptionKey').value;
      var plaintext = document.getElementById('plaintext').value;

      var encryptedData = CryptoJS.AES.encrypt(plaintext, encryptionKey).toString();

      document.getElementById('ciphertext').value = encryptedData;
    }

    function decrypt() {
      var encryptionKey = document.getElementById('encryptionKey').value;
      var ciphertext = document.getElementById('ciphertext').value;

      var decryptedData = CryptoJS.AES.decrypt(ciphertext, encryptionKey);
      var plaintext = CryptoJS.enc.Utf8.stringify(decryptedData);

      document.getElementById('plaintext').value = plaintext;
    }
  </script>