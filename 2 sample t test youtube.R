#The Question----
#“Researchers are testing a new cancer medicine. They have two groups of patients. The first group, group1, is given the new cancer medicine. The second group, group2, is given a placebo (water). After a certain period of time, they measure a health outcome (it could be tumor size, patient survival time, etc.). The researchers want to know if there is a significant difference in the health outcome between the two groups. What statistical test should they use?”

#The answer is: They should use a two-sample t-test. This test will allow them to compare the means of the two groups and determine if there is a significant difference between them.

#Null Hypothesis (H0): The true difference between the means of group1(Cancer Medicine Given) and group2(Water given-No medicine) is zero. In other words, there’s no significant difference between the two groups.
#Alternative Hypothesis (HA): The true difference between the means of group1 and group2 is not zero. 

#The p-value you get from the t-test will tell you whether to reject the null hypothesis or not. If the p-value is less than your chosen significance level (often 0.05), you reject the null hypothesis and conclude that there is a significant difference between the two groups. If the p-value is greater than your significance level, you fail to reject the null hypothesis, meaning you didn’t find enough evidence to conclude there’s a significant difference.

# Define two groups of data
group1 <- c(1, 2, 3, 4, 5)
group2 <- c(2, 3, 4, 5, 6)

# Perform a t-test
test_result <- t.test(group1, group2)

# Print the p-value
#In R, the $ sign is used to access specific variables from a list or a data frame. In the context of your code, ""test_result"" is an object that contains the results of a t-test. This object is a list that includes several different pieces of information about the t-test, such as the t-statistic, the degrees of freedom, and the p-value.

#Then you write test_result$p.value, you’re using the $ sign to access the p.value variable from the test_result list. This gives you the p-value of the t-test, which is a number between 0 and 1 that tells you the significance of the test result.

print(test_result)

#[1] 0.3465935 There p value is not less than .05 so we can not conclude that the two group have different effect of medicine or any other claim you are trying to prove.let’s make this simple and fun!

#Imagine you and your friends are playing a game of guessing the number of candies in a jar. You all make a guess, and the game leader knows the actual number. The game leader tells you whether your group’s guess is close to the actual number or not.

#In our case, the p-value is like the game leader’s decision. A p-value of 0.3465935 is like the game leader saying, “You’re somewhat close, but not super close to the actual number.” In scientific terms, this means there’s a 34.66% chance that the results from your experiment happened randomly, and not due to the factors you were testing.

#So, in this case, we can’t confidently say that the factors we were testing had a significant effect, because our guess wasn’t close enough to the actual number. We need more evidence  to make a stronger claim
