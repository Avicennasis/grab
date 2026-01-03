# grab

A modern, robust, and polite shell script wrapper for `wget` designed to download files from web directory listings and thread pages (e.g., 4chan).

## Features

- **Robust**: Validates inputs, handles errors strictly, and uses safe filename encoding.
- **Polite**: Respects `robots.txt` by default, includes rate limiting, random delays, and a configurable User-Agent.
- **Flexible**: Supports recursive downloads, file filtering (include/exclude), and custom output directories.
- **Cross-Platform**: Works on Linux, macOS, and Windows (via WSL/Git Bash).

## Usage

```bash
./grab.sh [OPTIONS] <URL> [OUTPUT_DIR]
```

### Examples

**1. Basic Directory Download**
Download all files from a directory listing to a local folder (defaults to `./domain/path`).
```bash
./grab.sh https://example.com/files/
```

**2. Download Images from a Thread (e.g., 4chan)**
Use `-H` to span hosts (needed for image CDNs), `-r -l 1` to grab linked files, and `-A` to filter for images.
```bash
./grab.sh -r -l 1 -H -A jpg,png,webm https://boards.4chan.org/wg/thread/12345
```

**3. Polite Scraping**
Limit rate to 200KB/s and wait 2 seconds between requests.
```bash
./grab.sh --rate-limit 200k --delay 2 https://example.com/archive/
```

**4. Dry Run**
See what would be downloaded without actually doing it.
```bash
./grab.sh --dry-run https://example.com/
```

## Options

| Option | Description |
|--------|-------------|
| `-r`, `--recursive` | Enable recursive retrieval (default: OFF). |
| `-l`, `--max-depth N` | Set recursion maximum depth level (default: 1 if -r is set). |
| `-A`, `--include PATTERN` | Comma-separated list of file extensions/patterns to accept (e.g. `jpg,png`). |
| `-R`, `--exclude PATTERN` | Comma-separated list of file extensions/patterns to reject. |
| `--dry-run` | Show what would be done without downloading. |
| `-c`, `--continue` | Resume partially downloaded files. |
| `--overwrite` | Overwrite existing files (default: skip if exists). |
| `--rate-limit RATE` | Limit download rate (e.g. `200k`, `1m`). |
| `--delay SECONDS` | Wait SECONDS between retrievals (default: 1). |
| `--timeout SECONDS` | Network timeout in seconds (default: 10). |
| `-U`, `--user-agent STR` | Set User-Agent string. |
| `-H`, `--span-hosts` | Enable spanning across hosts (needed for some CDNs). |
| `--ignore-robots` | Ignore robots.txt (NOT RECOMMENDED). |
| `-h`, `--help` | Show help message. |

## Safety & Ethics

- **No Parent**: The script automatically sets `--no-parent` to prevent ascending the directory tree.
- **Robots.txt**: Respected by default. Use `--ignore-robots` only if you have permission.
- **Guardrails**: Default recursion depth is limited.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
## Credits
**Author:** Léon "Avic" Simmons ([@Avicennasis](https://github.com/Avicennasis))
