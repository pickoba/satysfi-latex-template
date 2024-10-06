FROM ocaml/opam:ubuntu-22.04-ocaml-4.14 AS satysfi

RUN sudo apt-get update && sudo apt-get install -y \
    autoconf \
 && sudo rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/gfngfn/SATySFi

WORKDIR /home/opam/SATySFi

RUN git switch dev-0-1-0-separate-saphe-from-satysfi
RUN opam repository add satysfi-external https://github.com/gfngfn/satysfi-external-repo.git
RUN opam update && opam install -y . --deps-only --with-test
RUN opam exec -- make all
RUN opam install -y .

FROM paperist/texlive-ja:latest AS texlive

FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

COPY --from=satysfi /home/opam/.opam/*/bin/satysfi /usr/local/bin/satysfi
COPY --from=satysfi /home/opam/.opam/*/bin/saphe /usr/local/bin/saphe

COPY --from=texlive /usr/local/texlive /usr/local/texlive
RUN ln -sf /usr/local/texlive/*/bin/* /usr/local/bin/texlive
ENV PATH /usr/local/bin/texlive:$PATH

USER vscode
