verde="\e[0;32m\033[1m"
rojo="\e[0;31m\033[1m"
azul="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
cyan="\e[0;36m\033[1m"
fin="\033[0m\e[0m"


function numeroAleatorio(){

         aleatorio=$((RANDOM % 32 ))
         echo -e "$aleatorio"
  
}


function ruleta (){

  echo  ""
 

for ((i=0; i<=36; i+=3)); do
     columna=12
     if ((i > 0)); then
        if (( i % 2 == 0)); then
         echo -e "${verde}|$i|${fin}"
        else 
           echo -e "${rojo}|$i|${fin}"
        fi
        if ((i == 36)); then
            echo -e "${cyan}2to1${fin}"
        fi

      fi
     (( i % columna == 0)) && echo 
    done | column 

for ((i=2; i<=36; i+=3)); do
     fila=12
      if ((i > 0)); then
        if (( i % 2 == 0)); then
         echo -e "${verde}|$i|${fin}"
        else 
           echo -e "${rojo}|$i|${fin}"
        fi

        if ((i == 35)); then
            echo -e "${cyan}2to1${fin}"
        fi

    fi 
     (( i % fila == 0)) && echo 
    done | column 

for ((i=1; i<=36; i+=3)); do
     fila=12

       if ((i > 0)); then
        if (( i % 2 == 0)); then
         echo -e "${verde}|$i|${fin}"
        else 
           echo -e "${rojo}|$i|${fin}"
        fi

        if ((i == 34)); then
            echo -e "${cyan}2to1${fin}"
        fi

      fi
     

     (( i % fila == 0)) && echo 
    done | column

    
    printf "|%-5s " " "
    printf "%-19s |" "1st 12"
    printf "%-10s " " "
    printf "%-19s |" "2st 12"
    printf "%-14s " " "
    printf "%-15s |" "3st 12"
   
   echo


    printf "|%-10s |" "1-18"
    printf "%-3s " " "
    printf "%-10b" "${cyan}Par${fin}"
    printf "%-7s|" " "
    printf "%-10s" " "

    printf "%-25b" "${rojo}<>${fin} | ${verde}<>${fin}"
    printf "%-14s| " " "
    printf "%-2s " " "

    printf "%-20b " "${cyan}Impar ${fin}"
    printf "%2s |" " "
    printf "%-3s " " "

    printf   "%-9b|" "19-36 "

    echo " "

    
  
}


function  ingresarSaldo() {
    saldo=$1
    echo -e "${verde}Saldo actual:$saldo${fin}"


}


function metodos(){   
  

   opcion="$1"

   echo -e "Vamos jugar utilizando el metodo Martin Gala"
   echo -e "Este supuestamente si uno pierde tiene que aumentar al doble su apuesta inicial y asi sucesivamente"
   echo -e "Vamos a automatizar este proceso"
   echo -e "Hay que apostar al par o al impar y continuar hasta que ganes o te quedes sin saldo"
   echo -e "Ingresa el saldo total que tienes disponible para jugar  y la cantidad inicial de apuesta , decide si vas a jugar con el par o el impar" 
    read saldo 
    read apuesta 
    read juego

   while true ; do
   
   if [[ "$juego" == "par" ]]; then
        if (( $aleatorio % 2 == 0)); then
          echo -e "Apuesta inicial:$apuesta"
          echo -e "Nuevo Saldo:$(($saldo + $apuesta * 2 ))"
          echo -e "Ganaste"
          echo "Quieres seguir jugando o retirarte (Ingresa una opcion)?"
          read jugar
          if [[ "$jugar" == "si" ]]; then
              echo "Decidiste seguir jugando \n Ingresa tu nueva apuesta inicial"
              read apuesta
              break
          elif [[ "$jugar" == "no" ]]; then 
              echo -e "Buena Decision"
              exit 0
          else 
              echo -e "${rojo}opcion ingresa invalida Ya perdiste la cabeza seguro${fin}"
              exit 0
          fi
        
        else 
            apuesta=$(($apuesta * 2))
            saldo=$((saldo - $apuesta ))
            echo "Perdiste tu apuesta inicial ahora sera el doble"
            echo -e "Nueva apuesta:$apuesta"
            echo -e "Nuevo saldo :$saldo" 
            
          
    elif [[ "$juego" == "impar" ]]; then

       if (( $aleatorio % 2 == 0)); then
          echo -e "Apuesta inicial:$apuesta"
          echo -e "Nuevo Saldo:$(($saldo + $apuesta * 2 ))"
          echo -e "Ganaste"
          echo "Quieres seguir jugando o retirarte (Ingresa una opcion)?"
          read jugar
          if [[ "$jugar" == "si" ]]; then
              echo "Decidiste seguir jugando \n Ingresa tu nueva apuesta inicial"
              read apuesta
              break
          elif [[ "$jugar" == "no" ]]; then 
              echo -e "Buena Decision"
              exit 0
          else 
              echo -e "${rojo}opcion ingresa invalida Ya perdiste la cabeza seguro${fin}"
              exit 0
          fi
        
        else 
            apuesta=$(($apuesta * 2))
            saldo=$((saldo - $apuesta ))
            echo "Perdiste tu apuesta inicial ahora sera el doble"
            echo -e "Nueva apuesta:$apuesta"
            echo -e "Nuevo saldo :$saldo" 
      fi
   fi      

         
        
             
             
                  

          

  




}





function apostar(){
    aleatorio="$(numeroAleatorio)"

     ruleta
   
     echo -e "\n ${verde}A que numero quieres apostar${fin}"
     read numero
     echo -e "\nApostaste al numero :$numero"
     echo -e "\nGirando la ruleta..."
     
     if (( $numero == $aleatorio )); then
     echo "Salio el numero: $aleatorio"
     echo "Ganaste "

     else
     echo "Salio el numero: $aleatorio"
     echo "Perdiste"

    fi
    
      
}







while getopts "nh" opcion; do
      case $opcion in 
        
        n) apostar ;;
        h) ruleta 
           echo "" 
           echo -e "${rojo}Bienvenidos al panel de ayuda ${fin} \n 1) la opcion -n ${verde}juego normal${fin} \n2)${verde} -m metodo Tienes que ingresar un metodo  ejemplo -m martingala (me falta agregar el segundo metodo) ${fin}"
           echo ""
           ;;
        *) echo "Opcion invalida" ;;
       

      esac 
 done          













