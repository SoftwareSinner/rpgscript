#!/bin/bash


##########################################
# Clears entire screen before game launches
##########################################

clear


###########################
# Character Class Variables
###########################
char1=$(echo Warrior)
char2=$(echo Sorcerer)
char3=$(echo Cleric)
char4=$(echo Thief)


##########################
# Character Stat Variables
########################## 
stat1=$(echo Strength)
stat2=$(echo Intelligance)
stat3=$(echo HP)
stat4=$(echo Speed)
stat4=$(echo Defense)





##################################
# Declare varible types as integers
###################################
declare -i stat1_num_base
declare -i stat2_num_base
declare -i stat3_num_base
declare -i stat4_num_base

declare -i stat1_num_rand
declare -i stat2_num_rand
declare -i stat3_num_rand
declare -i stat4_num_rand

declare -i stat1_num_final
declare -i stat2_num_final
declare -i stat3_num_final
declare -i stat4_num_final



####################
# Map Variables
####################
map1=$(echo The Possessed Woods)
map2=$(echo City of The Dead)
map3=$(echo Dragon Alley)
map4=$(echo Witch Central)




#######################################################################################################################################################
# ALL FUNCTIONS :P
########################################################################################################################################################



##################################
# Map Selection Function 
##################################
function map_function ()


{

echo "Choose a map that you wish to explore. "
echo
echo
echo

echo "1 - $map1"
echo "2 - $map2"
echo "3 - $map3"
echo "4 - $map4"

read explore;

}

##################################
# Revert to map selection function
###################################
function revert_map_selection ()

{

echo " You have chose to leave this map... "
read
clear

map_function

}







############################################
# Creature  Encounters for The Possesed Woods
###########################################

creature[0]="Lost Ghoul"
creature[1]="Demented Ghost"
creature[2]="Ghost Knight"

Boss1="Possessed Knight"


###################################
# ASCII Art Functions 
###################################
function intro_ascii_art ()
{
echo "        ,     \    /      ,        "
echo "       / \    )\__/(     / \       "
echo "      /   \  (_\  /_)   /   \      "
echo " ____/_____\__\@  @/___/_____\____ "
echo "|             |\../|              |"
echo "|              \VV/               |"
echo "|  Welcome to the bash RPG game   |"
echo "|_________________________________|"
echo " |    /\ /      \\       \ /\    | "
echo " |  /   V        ))       V   \  | "
echo " |/            //               \| "
echo "               \V                  "
}

function warrior_ascii_art ()
{

echo -n $'\E[31m'










}

function map_ascii_art ()
{

echo "        '(___(_____)      __           '.   \  :  /   .'
                     /. _\            '.  \ : /  .'
                .--.|/_/__      -----____   _  _____-----
_______________''.--o/___  \_______________(_)___________
       ~        /.'o|_o  '.|  ~                   ~   ~
  ~            |/   |_|  ~'         ~
               '  ~ |_|        ~       ~     ~     ~
      ~    ~        |_|O  ~                       ~
             ~      |_||_____     ~       ~    ~
   ~    ~      .'':.|_|A:. ..::''.
             /:.  .:|_|.\ .:.  :.:\   ~
  ~         :..:. .:. .::..:  .:  ..:.       ~   ~    ~
             \.: .:  :. .: ..:: .lcf/
    ~      ~      ~    ~    ~         ~
               ~           ~    ~   ~             ~
        ~         ~            ~   ~                 ~
   ~                  ~    ~ ~                 ~        "


}

function Possessed_Knight ()

{

echo -n $'\E[31m'
echo $''
echo $'      _,.'
echo $'    ,` -.)'
echo $'   \'( _/\'-\\\\-.'
echo $'  /,|`--._,-^|          ,'
echo $'  \\_| |`-._/||          ,\'|'
echo $'    |  `-, / |         /  /'
echo $'    |     || |        /  /'
echo $'     `r-._||/   __   /  /'
echo $' __,-<_     )`-/  `./  /'
echo $'\'  \\   `---\'   \\   /  /'
echo $'    |           |./  /'
echo $'    /           //  /'
echo $'\\_/\' \\         |/  /'
echo $' |    |   _,^-\'/  /'
echo $' |    , ``  (\\/  /_'
echo $'  \\,.->._    \\X-=/^'
echo $'  (  /   `-._//^`'
echo $'   `Y-.____(__}'
echo $'    |     {__)'
echo $'          ()`'



}




###################################
# Transition Function
###################################
function transition_screen ()
{
clear
echo "
[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-##############
Name: $player_name_input ****  $stat1: $stat1_num_final **** $stat2: $stat2_num_final **** $stat3: $stat3_num_final ****  $stat4: $stat4_num_final
[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-[O\\\\\[========================-##############
"

}


###################################
# Function for Name Input
####################################
function get_player_name ()
{
echo " Please enter your name and hit enter..."
get_player_name_input=
while [[ $player_name_input = "" ]]; do
   read player_name_input
done


clear


}


################################
# Function for Player Confirmation
###############################
function get_player_confirmation ()
{
	


	
while [[ $response != "y" ]]; do
        read -r -p "Are you sure? [y/n] " response
        if [[ "$response" =~ ^(y)$ ]]; then
                clear
        elif [[ "$response" =~ ^(n)$ ]]; then
                player_name_input=$(echo "")
                clear
                get_player_name
        fi
done

clear
       
echo " Hello $player_name_input, Please pick a character class and hit enter. "

}

##########################################
# Battle Confirmation Function
##########################################
function battle_confirmation ()
{

while [[ $confirmation != "y" ]]; do
        read -r -p " Do you wish to battle this creature? [y/n] " confirmation
        if [[ "$confirmation" =~ ^(y)$ ]]; then
                echo "You have chose to battle this creature"
                 
        elif [[ "$confirmation" =~ ^(n)$ ]]; then
                echo " Dont be a coward!!!..... "
               battle_confirmation
                
        fi
done

clear


}


########################################
# Function for Battle Damage Number Roll
########################################
function battle_damage_dice_roll ()
{


battle_confirmation

clear

echo " Hit enter to roll virtual dice for damage. You must roll a number higher than 5 to destroy this creature. "
read

battle_damage_dice_roll=$((( RANDOM % 10 )  + 1 ))

echo " You did $battle_damage_dice_roll damage to creature. "


if [[ $battle_damage_dice_roll -gt 5 ]]
then
echo " You have defeated this creature. "

elif [[ $battle_damage_dice_roll -lt 5 ]]
then 
echo " You have been defeated by this creature..Try again "

fi

}


##########################################
# Random Creature Generator Function 
###########################################
function random_creature_generator_lost_woods ()
{

random_creature_generator_lost_woods=$(( RANDOM % 3 ))

echo  ${creature[$random_creature_generator_lost_woods]} 

}







####################################
# Function for character stats
####################################
function set_base_stats ()
{
	if [[ $class == "1" ]]; then
		stat1_num_base=3
		stat2_num_base=1
		stat3_num_base=1
		stat4_num_base=1
	elif [[ $class == "2" ]]; then
		stat1_num_base=1
		stat2_num_base=3
		stat3_num_base=1
		stat4_num_base=1
	elif [[ $class == "3" ]]; then
		stat1_num_base=1
		stat2_num_base=1
		stat3_num_base=3
		stat4_num_base=1
	elif [[ $class == "4" ]]; then
		stat1_num_base=1
		stat2_num_base=1
		stat3_num_base=1
		stat4_num_base=3
	fi
}

function create_character_stats ()
{
	set_base_stats
	echo $stat1
		stat1_num_rand=$(echo $(( 1 + RANDOM % 7)))
		stat1_num_final=$(( stat1_num_rand + stat1_num_base ))
		echo Your character stat is: $stat1_num_final
	echo $stat2
		stat2_num_rand=$(echo $(( 1  + RANDOM % 7)))
		stat2_num_final=$((stat2_num_rand + stat2_num_base))
		echo Your character stat is: $stat2_num_final
	echo $stat3
		stat3_num_rand=$(echo $(( 1 + RANDOM % 7)))
		stat3_num_final=$((stat3_num_rand + stat3_num_base))
		echo Your character stat is: $stat3_num_final
	echo $stat4
		stat4_num_rand=$(echo $(( 1 + RANDOM % 7)))
		stat4_num_final=$((stat4_num_rand + stat4_num_base))
		echo Your character stat is: $stat4_num_final
}




##############################
#Character Selection Function
##############################


function character_selection ()

{
echo "1 - Warrior"
echo "2 - Sorcerer"
echo "3 - Cleric"
echo "4 - Thief"

read class;

clear


case $class in
        


        1) echo " You have chosen the $char1. The $char1 is known for his strength in combat. "
	   echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo
          
              
        warrior_ascii_art
      create_character_stats
                ;;
        2) echo " You have chosen the $char2. Magic is your primary weapon. Their high Attunement and Intelligence makes learning more sorcery and pyromancy very easy."
		
           echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo 
                 

		create_character_stats
                ;;
        3) echo " You have chosen the $char3. $char3's have the ability to heal and are fairly balanced with learning abilities."
	   echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo	
		
                
                create_character_stats
                ;;
        4) echo " You have chosen the $char4. $char4's aren't a resilient class due to light armor, very low Vitality and a weak shield, but have high mobility. The attack speed of the $char4's Knife makes it a solid one on one weapon."
		
           echo
           echo
           echo
           echo
           echo
           echo
           echo
           echo 
		create_character_stats
                ;;
                
        *) echo " Please pick a class from the list. "
		character_selection
		;;
esac

echo
echo
echo
echo
echo
echo




}



############################################
# Map Selections
###########################################
function map_selections ()

{



echo " Press enter to embark on your journey...Evil awaits you. "


read


clear


transition_screen 

echo " You have arrived ashore to the Lost Island.. "

read

map_ascii_art 

map_function

clear

case $explore in
      1) echo " You have chosen to wander $map1. Be aware, Those who wander these woods become possessed by pure evil. "
           echo
           echo
           echo
           echo
           echo
           echo
           echo
            
            ;;
      2) echo " You have chosen to explore the $map2 .....The dead never sleep and are always hungry for flesh. "


           echo
           echo
           echo
           echo
           echo
           echo
           echo

            ;;
      3) echo " You have chosen to visit $map3. The heat will consume you...Stay away from the gold! "
           echo
           echo
           echo
           echo
           echo
           echo
           echo


            ;;
      4) echo " You have chosen to walk $map4 .... The magic is strong here,the sun is never present, Stay aware of your surroundings."


           echo
           echo
           echo
           echo
           echo
           echo
           echo

             ;;
      *) echo " Please chose your destination for travel.";;
esac

echo " What will you do next? "

echo "1 -Wander the woods"
echo "2 -Battle creatures"
echo "3 -Leave The Possessed Woods"
echo "4 -Find The Possessed Knight"

read choice;

clear

case $choice in
     1) echo " You have decided to wander the woods and encountered...."
       random_creature_generator_lost_woods 
       battle_damage_dice_roll
       ;;
     
     2) echo " You chose to battle creatures and will fight a... "
       random_creature_generator_Lost_Woods
       battle_damage_dice_roll
       battle_confirmation
        ;;
     3) echo
        revert_map_selection
        ;;
     4) echo " Are you ready to face The Possessed Knight?...This enemy is powerful."
        echo
        echo
        echo
        echo
        echo
        echo
        echo
        battle_damage_dice_roll
       ;;
     *) echo " Please make a selection from the list....";;

esac

}



#######################################################################################################################################################
# This is where the script runs in order from functions made and statements
#######################################################################################################################################################



intro_ascii_art

get_player_name

get_player_confirmation


character_selection

map_selections



