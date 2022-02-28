from string import ascii_lowercase
def solution(sentence):

    sentence2 = sentence.lower()
    print(ascii_lowercase)
    alpha_list = list(ascii_lowercase)
    for i in range(len(sentence)):
        if sentence2[i] in alpha_list:
            print(sentence2[i])
            alpha_list.remove(sentence2[i])
    if len(alpha_list) ==0:
        return "perfect"
    print(alpha_list)
    print("".join(alpha_list))
    answer = "".join(alpha_list)
    return answer
sentence= "aaaaa"
solution(sentence)
