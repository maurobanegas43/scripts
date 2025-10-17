#!/bin/bash

# Primera tecnica Martin gala 
#Esta tecnica intenta aumentar al doble la apuesta si pierde y si gana volver a empezar 


verde="\e[0;32m\033[1m"
rojo="\e[0;31m\033[1m"
azul="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
cyan="\e[0;36m\033[1m"
fin="\033[0m\e[0m"



function control_c() {
    echo -e "${rojo}\nSaliendo del juego de la ruleta${fin}"
    exit 1
}

trap control_c INT



function  ingresarSaldo() {
    saldo=$1
    echo -e "${verde}Saldo actual:$saldo${fin}"


}



function numeroAleatorio(){
     aleatorio=$((RANDOM % 100 + 1))
     echo "El numero aleatorio es: $aleatorio"


}



function apostar(){
    numeroAleatorio
     echo -e "A que numero quieres apostar"
     read numero
     echo -e "$numero"

     if [[ "$numero" -eq "$aleatorio" ]]; then
         if (( $aleatorio % 2 == 0)); then 
            declare -g jugador="ganaste"
            echo -e "Ganaste y el numero es par"
            echo -e "El numero es negro"
            if [[ "$aleatorio"  ]]



          else 
            echo -e "Ganaste y el numero es impar"
            echo -e "El numero es rojo"
          fi          
     else
         echo -e "Perdiste"

      fi

}




function metodos(){   
  

   opcion="$1"
   echo "Hola estas dentro de la funcion"

   while true; do
   declare -i partidas=0
   ruleta

   if [["$partidas" -eq 0 ]]; then
        echo -e ""

   if [ "$opcion" = "martingala" ]; then 
        echo -e "${verde}Este metodo es el martin Gala ${fin}"
        echo -e "${verde}Si pierdes se va a duplicar la apuesta inicial${fin}"
        echo -e "Ingresa la cantidad a apostar"
        read apuesta
        while true; do
          
           echo -e " ${rojo}Ganaste o perdiste?${fin}"
           apostar
          
           partidas=$(($partidas + 1))
          

           if [[ "$aleatorio" == "gane" ]]; then 
                
                echo -e "${verde}Felicidades ganaste tu apuesta fue de :$apuesta \nTu nuevo saldo es :$(($saldo+$apuesta * 2))"
                echo -e "${verde}Jugaste un total de :$partidas${fin}"
                echo -e "Quieres seguir jugando o retirarte?"

                read  jugar 
                if [[  "$jugar" == "si"  ]];then
                   echo -e "${rojo}Decidiste seguir jugando${fin}"
                   break
                   
                else 
                  echo -e "${verde}Buena decision , retirarse siempre es la mejor opcion${fin}"
                  exit 0
                fi

           elif [[ "$resultado" == "perdi" ]]; then 
                apuesta=$(($apuesta * 2))
                echo -e "${verde}la siguiente apuesta es el doble de la inicial: $apuesta  ${fin}"
                echo -e "Intento numero:$partidas"


           else 
                echo -e "${verde}Opcion ingresa no es valida, seguro ya perdiste la cabeza${fin}"
                
                  
         fi
         done
      elif [[ "$opcion" ==  "segunda"  ]]; then 
         echo -e "Mira este mi segundo metodo"

      else 
          echo -e "${rojo}Ingresaste un metodo invalido${fin}"  

     fi
     done


}


#cuando se hacen declaraciones de variables en bash , son variables globales por defecto
# Se puede utilizar de esa forma o simplemente pasandole como argumento a la funcion 


while getopts "a:m:" opcion; do
    case $opcion in
        a)saldo=$OPTARG
           ingresarSaldo $saldo ;; 
        m) metodo=$OPTARG
            metodos "$metodo";;
        *) echo "Opcion invalida" ;;
    esac
done


