# Python & Environment Configuration (uv-first)

## Core Philosophy
This system has been migrated to use **`uv`** as the primary Python package and tool manager. **Avoid using `pip`, `pipx`, `poetry`, or `conda`** for global tool management or environment creation.

## Shell Environment
- **Shell:** Nushell
- **Config:** `~/.config/nushell/config.nu`
- **Completions:** `uv` completions are stored in `~/.config/nushell/uv_completions.nu` and sourced in the main config.
- **Path:** `~/.local/bin` is in the PATH to support `uv tool` executables.

## Dependency Management Workflow

### 1. Global Tools (`uv tool`)
Applications and CLI utilities are installed in isolated environments via `uv tool install`. 
*   **Current migrated tools:** `manim`, `pwntools`, `jupyter-core` (for the `jupyter` command), `jupyterlab`, `notebook`, `playwright`, `trafilatura`, `sysmontask`.
*   **Usage:**
    - Install: `uv tool install <package>`
    - List: `uv tool list`
    - Uninstall: `uv tool uninstall <package>`

### 2. Local Projects (`uv init`)
Use `uv` for all project-level virtual environments.
*   **Initialize:** `uv init` (creates `pyproject.toml`)
*   **Add dependency:** `uv add <package>`
*   **Run code:** `uv run <script.py>` (automatically manages the venv)
*   **Sync environment:** `uv sync`

### 3. Python Versions
Use `uv` to manage Python interpreters instead of `pyenv`.
- `uv python install 3.12`
- `uv python list`

---

## System Configuration (`yolk` + Rhai)
The system uses **`yolk`** for dotfile and package deployment management.
- **Config Location:** `~/.config/yolk/`
- **Logic:** Written in Rhai (`.rhai` files).
- **Key Files:**
    - `yolk.rhai`: Main entry point.
    - `wmdesktop.rhai`: Window manager and desktop tool configurations (e.g., `niri`, `waybar`, `vicinae`).
    - `helper.rhai`: Contains helper functions like `pkg_postscripts` which uses `yay`/`paru` for AUR installations.
- **Common Alias:** `yy` -> `yolk sync`

## Important Cleanup Notes
- **User-site Pip:** Global `pip install --user` should be avoided to prevent dependency confusion. 
- **Conflict Resolution:** If a package exists in both `pip` and `uv tool`, remove it from `pip` (`pip uninstall <pkg>`) and rely on the `uv` version.
- **AUR Packages:** Packages not available on PyPI (like `vicinae`) are managed via `yolk` hooks using `yay` or `paru`.

## Yolk Git Workflow
**CRITICAL:** Any changes made to files within `~/.config/yolk/` **MUST** be immediately followed by a git commit using the `yolk` command wrapper.
- **Stage & Commit:** `yolk git add . && yolk git commit -m "<type>(<scope>): <description>"`
- **Conventional Commits:** Use standard types like `feat`, `fix`, `docs`, `chore`, etc. (e.g., `docs(yolk): update commit convention`).
- **Do not** use standard `git` commands in this directory; always prefix with `yolk`.

## Sync Method
When updating configurations or dependencies via `yolk` (especially when adding new packages), follow this reliable pattern to ensure changes are fully applied and hooks are triggered:

1.  **Disable the egg:**
    - Edit the relevant `.rhai` file (e.g., `editor.rhai`).
    - Set `enabled: false` for the target egg.
2.  **Sync:**
    - Run `yolk sync`. This cleans up the previous state if needed.
3.  **Enable the egg:**
    - Edit the `.rhai` file again.
    - Set `enabled: true`.
4.  **Sync:**
    - Run `yolk sync`. This triggers the installation hooks (`pkg_install`) and deploys the configuration.

