
def solution(character, monsters):
    time1 = []
    Monster_Name=[]
    for i in range(len(monsters)):
        character_Hp = int(character.split(" ")[0])
        character_A = int(character.split(" ")[1])
        character_D = int(character.split(" ")[2])
        Monster_Name.append(monsters[i].split(" ")[0])
        Monster_Exp = int(monsters[i].split(" ")[1])
        Monster_Hp = int(monsters[i].split(" ")[2])
        Monster_A = int(monsters[i].split(" ")[3])
        Monster_D = int(monsters[i].split(" ")[4])

        tmp_time1 = 0
        if character_A-Monster_D >  0:  #캐릭터의 공격력이 몬스터의 방어력 보다 높으면 // 잡을 수 있으면
            while True : # 몬스터 hp가 0이상일 때 while
                tmp_time1+=1
                Monster_Hp-=(character_A-Monster_D)
                if Monster_Hp <= 0:
                    time1.append([Monster_Exp/tmp_time1,Monster_Exp,i])
                    break
                character_Hp -= (Monster_A-character_D)
                if character_Hp <= 0:
                    time1.append([0,0,0])
                    break
                else:
                    character_Hp = int(character.split(" ")[0]) #캐릭터 체력 회복
        else:
            time1.append([0,0,0])
    time1.sort(key=lambda x : (-x[0], -x[1], x[2]))

    answer = (Monster_Name[time1[0][2]])

    return answer

character= "10 5 2"
monsters = ["Knight 3 10 10 3","Wizard 5 10 15 1","Beginner 1 1 15 1"]
solution(character, monsters)