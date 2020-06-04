FROM kalilinux/kali-rolling:latest
MAINTAINER  Heitor Gouvêa <hi@heitorgouvea.me>

WORKDIR /home/
EXPOSE 1337 9090

RUN apt -qy update
RUN apt list --upgradable
RUN apt -qy dist-upgrade

RUN apt install -qy \
	python \
	pip \
	python3 \
  	python3-pip \
  	man \
  	unzip \
  	wpscan \
  	sqlmap \
  	john \
	amass \
  	apktool \
  	exploitdb \
  	weevely \
  	fcrackzip \
  	metasploit-framework \
  	hashid \
  	jadx \
  	hydra \
  	netcat \
  	fping \
  	exiftool \
  	wordlists \
	tree \
	testssl.sh \
	libwww-perl \
	libdbd-mysql-perl \
  	&& apt clean \
  	&& apt -y autoremove \
  	&& rm -rf /var/lib/apt/lists/*

RUN gunzip /usr/share/wordlists/rockyou.txt.gz
RUN cpan install Switch \
	IO::Socket::SSL \
	LWP::UserAgent \
	LWP::Protocol::https \
	HTTP::Request \
	JSON \
	Mojolicious::Lite \
	Config::Simple \
	WWW::Mechanize \
	re::engine::TRE \
	DBIx::Custom \
	Email::MIME \
	Email::Sender::Simple \
	Email::Sender::Transport::SMTP \
	Perl::Critic \
	Path::Iterator::Rule \
	Mojo::mysql \
	Mojo::Util