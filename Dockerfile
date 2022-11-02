FROM perl:latest

RUN apt update
RUN apt upgrade -y
RUN apt install -y vim

ENV PERL_CPANM_OPT="--notest --no-man-pages --with-recommends --with-suggests --with-all-features --with-configure --with-develop"

# install Minilla
RUN cpanm Minilla


# install some modules, that are very heavy to install.
RUN cpanm Amon2
RUN cpanm DBD::SQLite LWP::Protocol::https DBD::mysql
RUN cpanm Catalyst::Runtime
RUN cpanm DBIx::Class
RUN cpanm Dist::Milla
RUN cpanm Tiffany
RUN cpanm Task::BeLike::TOKUHIROM
RUN cpanm Test::Perl::Critic Perl::Critic
RUN cpanm HTTP::Server::Simple::CGI Spiffy WWW::MobileCarrierJP

RUN git config --global user.email "tokuhirom@gmail.com"
RUN git config --global user.name "Tokuhiro Matsuno"

WORKDIR /target/

CMD [ "/bin/bash", "-c", "cpanm --installdeps . && minil release" ]

