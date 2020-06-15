welcome_msg() {
  echo ${BG_CYAN}${BLACK} \
    "Here's to lookin' at ya, kid" ${RESET}${WHITE}${BG_BLACK} \
    Jase the Ace ${RESET}${BG_MAGENTA}${BLACK} \
    Shine On, You Crazy Diamond ${RESET}
      echo "------------------------------------------"
      echo $(git --version)
      echo $(python -V)
      echo "Node $(node -v)"
      echo "------------------------------------------"

}

welcome_msg
