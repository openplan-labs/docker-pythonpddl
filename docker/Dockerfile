FROM ubuntu:24.04

ENV TZ Europe/Paris

LABEL maintainer="Erwin Lejeune <erwin.lejeune15@gmail.com>"
LABEL maintainer2="Sampreet Sarkar <sampreet.sarkar@gmail.com>"

RUN apt-get update -y && \
    apt-get install -y python3 && \
    apt-get install -y python3-pip && \
    apt-get install -y wget && \
    apt-get install -y git && \
    python3 -m pip install --upgrade pip

RUN wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.2-linux-x86_64.tar.gz
RUN tar -xvzf julia-1.5.2-linux-x86_64.tar.gz
RUN cp -r julia-1.5.2 /opt/
RUN ln -s /opt/julia-1.5.2/bin/julia /usr/local/bin/julia
RUN julia --color=yes -e 'using Pkg; Pkg.add(Pkg.PackageSpec(path="https://github.com/APLA-Toolbox/PDDL.jl"))'
RUN julia --color=yes -e 'using Pkg; Pkg.add(Pkg.PackageSpec(path="https://github.com/JuliaPy/PyCall.jl"))'
RUN cd /

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN julia --color=yes -e 'using Pkg; Pkg.add(Pkg.PackageSpec(path="https://github.com/APLA-Toolbox/PDDL.jl"))'
RUN julia --color=yes -e 'using Pkg; Pkg.add(Pkg.PackageSpec(path="https://github.com/JuliaPy/PyCall.jl"))'

WORKDIR /pythonpddl

COPY requirements.txt /.

RUN python3 -m pip install -r /requirements.txt

COPY docker/entrypoint.sh /.

EXPOSE 8080

ENTRYPOINT [ "/entrypoint.sh" ]
