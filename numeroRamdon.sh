verde="\e[0;32m\033[1m"
rojo="\e[0;31m\033[1m"
azul="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
cyan="\e[0;36m\033[1m"
fin="\033[0m\e[0m"





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
            echo -e "Ganaste y el numero es par"
               if [["$aleatorio" -eq "$i"]]; then
                  echo -e "El numero es:$aleatorio\n Color:negro \nEsta en la primer tercio que va desde {1..12}"
               elif [[ "$aleatorio" -eq "$i"  ]]; then 
                  echo -e "El numero es:$aleatorio\n Color:negro \nEsta en la segundo tercio que va desde {13..24}"

               elif [[ "$aleatorio" -eq "$i"  ]]; then 
                  echo -e "El numero es:$aleatorio\n Color:negro \nEsta en la tercer tercio que va desde {25..32}"
        
          else 
            echo -e "Ganaste y el numero es impar"
               if [["$aleatorio" -eq "$i"]]; then
                  echo -e "El numero es:$aleatorio\n Color:negro \nEsta en la primer tercio que va desde {1..12}"
               elif [[ "$aleatorio" -eq "$i"  ]]; then 
                  echo -e "El numero es:$aleatorio\n Color:negro \nEsta en la segundo tercio que va desde {13..24}"

               elif [[ "$aleatorio" -eq "$i"  ]]; then 
                  echo -e "El numero es:$aleatorio\n Color:negro \nEsta en la tercer tercio que va desde {25..32}"


          fi          
     else
         echo -e "Perdiste"

      fi


}


columna1="$(for i in {1..12}; do
  
    if (( $i % 2 == 0 )); then 
       echo -e "${azul}$i${fin}"
     else 
      echo "${rojo}$i${fin}"
      fi  
done)"

columna2="$(for i in {13..24}; do
       if (( $i % 2 == 0 )); then 
       echo -e "${azul}$i${fin}"
     else 
      echo "${rojo}$i${fin}"
      fi  
done)"

columna3="$(for i in {25..36}; do
       if (( $i % 2 == 0 )); then 
       echo -e "${azul}$i${fin}"
     else 
      echo "${rojo}$i${fin}"
      fi  
done)"

columnas="$(paste <(echo -e "0\n") <(echo -e "$columna1") <(echo -e "$columna2") <(echo -e "$columna3"))"
echo -e "$columnas"
