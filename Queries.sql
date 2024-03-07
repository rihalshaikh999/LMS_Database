use LMS_Database;
-- 1- find all candidate having java technology (correct)
select * from Fellowship_Candidate c inner join Tech_Stack t on c.User_Id = t.Creator_User where t.Tech_Name = 'java';

-- 2- find all mentors and ideations have java technology
select * from mentor m
join tech_stack t1 on m.Creator_User = t1.Creator_User
join mentor_ideation_map i on m.Creator_User = i.Creator_User
join tech_stack t2 on i.Creator_User = t2.Creator_User
where t1.Tech_Name = 'java' and t2.Tech_Name = 'java';

-- 7- find name of candidatcandidate_bank_detailscandidate_bank_detailse which did not assign technology
select First_Name from Fellowship_Candidate c inner join Tech_Stack t on c.User_Id = t.Creator_User where t.Tech_Name is null;

-- 8- find name of cnadidate which is not submit documents
select First_Name from Fellowship_Candidate c inner join candidate_documents t on c.Creator_User = t.Creator_User where t.Status='pending';

-- 9- find name of candidate which is not submit bank details
select Name from candidate_bank_details where Account_Number is null;

-- 10-find name of candidates which is joined in dec month
-- select First_Name from Fellowship_Candidate where Joining_Date like '_____01___';
SELECT First_Name FROM Fellowship_Candidate WHERE MONTH(Joining_Date)=12;

-- 11-find name of candidates which is end of couse in feb
-- SELECT First_Name FROM candidate_stack_assignment WHERE MONTH(Complete_Date)=02;
select First_Name from Fellowship_Candidate c inner join candidate_stack_assignment t on c.User_Id = t.Creator_User where Complete_Date like '_____02___';

-- 12-find name of candidates which is ending date accounding to joining date if joining date is 22-02-2019
select First_Name from Fellowship_Candidate c inner join candidate_documents t on c.Creator_User = t.Creator_User where c.Joining_Date='2019-02-22';

-- 13-find all candidates which is passed out in 2019 year
select * from Fellowship_Candidate c inner join candidate_qualification t on c.Creator_User = t.Creator_User where t.Passing_Year='2019';

-- 14-which technology assign to which andidates which is having MCA background
select * from Fellowship_Candidate c inner join candidate_qualification t on c.Creator_User = t.Creator_User where t.Degree_Name='MCA';

-- 15-how many candiates which is having last month
select COUNT(*) as Temp_Table from Fellowship_Candidate
where month(Joining_Date) = month(current_date - interval 1 month) and year(Joining_Date) = year(current_date - interval 1 month);

-- 16-how many week candidate completed in the bridgelabz since joining date candidate id is 2
select DATEDIFF(NOW(), joining_date) / 7 as weeks from Fellowship_Candidate c inner join company t on c.Creator_User = t.Creator_User where t.Name='bridgelabz';

-- 17-find joining date of candidate if candidate id is 4
select Joining_Date from Fellowship_Candidate where User_Id=4;

-- 18-how many week remaining of candidate in the bridglabz from today if candidate id is 5
select CEIL(DATEDIFF(Complete_Date, NOW()) / 7) as weeks from Fellowship_Candidate c inner join candidate_stack_assignment t on c.Creator_User = t.Creator_User where t.Creator_User =5;

-- 19-how many days remaining of candidate in the bridgelabz from today if candidate is is 6
SELECT DATEDIFF(Complete_Date, NOW()) AS days from Fellowship_Candidate c inner join candidate_stack_assignment t on c.Creator_User = t.Creator_User where t.Creator_User =6;

-- 20-find candidates which is deployed
select * from Fellowship_Candidate c 
inner join company l on c.Creator_User= l.Creator_User
where Status="Active";

-- 21-find name and other details and name of company which is assign to condidate.
select * from Fellowship_Candidate c 
inner join company l on c.Creator_User= l.Creator_User;

-- 22-find all condidate and mentors which is related to lab= banglore/mumbai/pune.
select * from Fellowship_Candidate c 
inner join mentor t on c.Creator_User = t.Creator_User
inner join Lab l on c.Creator_User= l.Creator_User
where l.Location='mumbai';

-- 23-find buddy mentors and ideation mentor and which technology assign to perticular candidate if candidate id is 6
select * from Fellowship_Candidate c 
inner join mentor t on c.Creator_User = t.Creator_User
inner join mentor_ideation_map l on c.Creator_User= l.Creator_User
where c.User_Id=6;
