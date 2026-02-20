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

@build:
    just _rendercv false

@watch:
    just _rendercv true

clean:
    rm -r build/
