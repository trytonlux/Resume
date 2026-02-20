default: build

[positional-arguments]
_rendercv watch:
    #!/usr/bin/env bash
    args=()
    args+=("--dont-generate-markdown")
    args+=("--dont-generate-png")
    args+=("--typst-path" "build/Resume.typ")
    args+=("--pdf-path" "build/Resume.pdf")

    if [[ "$1" == "true" ]]; then
        args+=(--watch)
    fi

    uv run rendercv render "${args[@]}" Resume.yaml

# render to pdf
@build:
    just _rendercv false

# watch file for changes
@watch:
    just _rendercv true

clean:
    rm -r build/

# create release tag
release:
    git tag -a v{{ datetime("%Y.%m.%d") }} -m "Version {{ datetime("%Y.%m.%d") }}"
