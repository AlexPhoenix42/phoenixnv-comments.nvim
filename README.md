
# **nv-comments**  
*A tiny, fast, dependency‑free Neovim plugin for toggling `//` comments in normal and visual mode.*

## ✨ Features
- Toggle `//` comments in **normal mode**  
- Toggle `//` comments across **visual selections**  
- Works on **any filetype** that uses `//`  
- Zero dependencies  
- Pure Lua  
- Works on **Neovim 0.8+**, including **0.13‑dev**  
- Simple, predictable behavior — no Treesitter, no magic, no surprises

---

## 📦 Installation (Lazy.nvim)

```lua
{
  "alexphoenix42/phoenixnv-comments",
  config = function()
    require("nv_comments").setup()
  end,
}
```

You can also customize the keybinding:

```lua
{
  "alexphoenix42/phoenixnv-comments",
  config = function()
    require("nv_comments").setup({
      key = "<A-/>",  -- default
    })
  end,
}
```

---

## 🎮 Usage

### **Normal mode**
Press **Alt+/** to toggle comment on the current line.

### **Visual mode**
Select multiple lines and press **Alt+/** to toggle comments on the entire block.

The plugin automatically detects whether the selection is fully commented or not, and applies the correct action.

---

## ⚙️ Configuration

`setup()` accepts an optional table:

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `key` | string | `<A-/>` | Keybinding for both normal and visual mode |

Example:

```lua
require("nv_comments").setup({
  key = "<C-_>",  -- Ctrl+/
})
```

---

## 🧠 How it works

`nv-comments` uses a simple, reliable approach:

- If a line starts with `//`, it is **uncommented**
- Otherwise, it is **commented**
- Visual mode checks the entire selection:
  - If *all* lines are commented → **uncomment**
  - Otherwise → **comment**

No regex errors.  
No operatorfunc.  
No `<Plug>` mappings.  
No runtime surprises.

---

## 📁 Project Structure

```
nv-comments/
├── lua/
│   └── nv_comments/
│       └── init.lua
└── README.md
```

---

## 🛠️ Roadmap

- [ ] Filetype‑aware comment styles (`#`, `--`, `/* */`, etc.)  
- [ ] Block comment toggling  
- [ ] Treesitter integration (optional)  
- [ ] Unit tests  

---

## 🤝 Contributing

Issues and PRs are welcome.  
If you have ideas for improvements, feel free to open a discussion.

---

## 📜 License

## License
This project is licensed under the GNU General Public License v3.0 — see the [LICENSE](LICENSE) file for details.

---

