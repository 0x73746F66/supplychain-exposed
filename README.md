# supplychain.exposed

> We defend software in the wrong place, too late, with data we can't trust. The fix is at the source.

A short book, published as a static website laid out like an ebook. It makes one
argument from many angles. The control that stops a supply-chain attack was never
a waiting period, a catalog number, or a generic scanner. It was **detection**,
and its home is the source, run **at publish, before a package is installable**.

From that single idea it presses three demands:

1. **Registries must scan before they publish.** npm, and the company that owns
   the registry, the advisory database, and the developer platform most of the
   world's software passes through, can stop malware at the door using detection
   it already runs. Cooldown timers only start counting after the attacker has
   already had his week.
2. **Track the malware.** The CVE Program is 1999 thinking that refuses to admit
   1999 is over, and ADP is the death rattle. The thing landing on developer
   laptops is malware, and the ledger everyone treats as canon barely records it.
3. **Free the data and trust the package manager.** Vulnerability data must be
   free, accessible, well-formed, enriched, and good, fit for AI coding agents
   and privacy-preserving IOC sharing. Package managers with reachability are the
   successor to generic SCA. The SBOM is an *input* to SCA, not an output.

## Read it

Published via GitHub Pages: <https://0x73746f66.github.io/vulnerability-manifesto/>

## Build it locally

Requires [Hugo extended](https://gohugo.io/installation/) version 0.158 or newer.

```bash
hugo server        # live preview at http://localhost:1313/
hugo --gc --minify # production build into ./public
```

There is **no external theme** and no runtime JavaScript framework. The entire
ebook look lives in `layouts/` and `assets/css/book.css`, and the fonts
(EB Garamond, Playfair Display) are self-hosted under `static/fonts/` so the
site never calls home.

## Structure

| Path | What it is |
| --- | --- |
| `content/_index.md` | The cover and table of contents |
| `content/chapters/` | The preface, seven chapters, and a coda, ordered by `weight` |
| `layouts/` | The hand-built ebook templates |
| `assets/css/book.css` | The whole aesthetic |
| `.github/workflows/deploy.yml` | Hugo to GitHub Pages on every push to `main` |

## Licence

- Prose (`content/`): **CC BY 4.0**. See [`CONTENT-LICENSE.md`](CONTENT-LICENSE.md). Quote it, translate it, spread it.
- Template (layouts, CSS, config): **MIT**. See [`LICENSE`](LICENSE).

Built by [Christopher Langton](https://github.com/0x73746F66). Detection donated to any registry willing to run it: [Vulnetix](https://vulnetix.com).
