Result =[]
scorelist = []

if __name__ == '__main__':
    for _ in range(int(input())):
        name = input()
        score = float(input())
        Result.append([name,score])
        scorelist += [score]
    second_lowest =sorted(list(set(scorelist)))[1] 
    for firstname, score_own in sorted(Result):
        if score_own == second_lowest:
            print(firstname)
