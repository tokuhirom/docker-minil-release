FROM perl:latest

RUN apt update
RUN apt upgrade -y
RUN apt install -y vim

# install Minilla
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Minilla


# install some modules, that are very heavy to install.
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Amon2
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features DBD::SQLite LWP::Protocol::https DBD::mysql
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Catalyst::Runtime
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features DBIx::Class
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Dist::Milla
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Tiffany
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Task::BeLike::TOKUHIROM
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features Test::Perl::Critic Perl::Critic
RUN cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features HTTP::Server::Simple::CGI Spiffy WWW::MobileCarrierJP

RUN git config --global user.email "tokuhirom@gmail.com"
RUN git config --global user.name "Tokuhiro Matsuno"

WORKDIR /target/

CMD [ "/bin/bash", "-c", "cpanm --notest --no-man-pages --with-recommends --with-suggests --with-all-features --installdeps --with-configure --with-develop . && minil release" ]

