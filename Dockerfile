FROM ubuntu:22.04

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
    apt install -y iputils-ping net-tools dnsutils tcpdump ca-certificates lsb-release gnupg wget ssh openssh-server python3 python3-pip git vim sudo ansible zsh curl

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="afowler"/' /root/.zshrc

RUN chsh -s $(which zsh)

WORKDIR /root

CMD ["zsh"]