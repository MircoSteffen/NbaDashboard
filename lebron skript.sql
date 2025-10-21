select * from king_james kj;

--1.durchschnitt 30 punkte 500K -- Ja
SELECT AVG(PTS) as durch_punkte
FROM king_james kj;

--2.die teilnahme an 65% der spiele -> 500k$

SELECT COUNT(*) as spiele_65
FROM king_james kj 
WHERE GP IS NOT NULL;

--2.wie viele hat er insgesamt?

SELECT COUNT(*) as spiele_ges
FROM king_james kj;

--2.Hat er die 65% erreicht? 500K -- Ja

SELECT 
  COUNT(GP) as spiele_played,
  CASE 
    WHEN COUNT(GP) >= 54 THEN 'Ja'
    ELSE 'Nein'
  END AS bonus_kriterium_ja
FROM king_james kj;

--3.Gegener gegen die er Gespielt hat 100K -- Nein

SELECT COUNT(DISTINCT Opp) as teams
FROM king_james kj 
WHERE GP IS NOT NULL;

--Bedingung/ Fazit
SELECT 
  COUNT(DISTINCT Opp) AS teams_gespielt,
  CASE 
    WHEN COUNT(DISTINCT Opp) = 29 then 'Ja'
    ELSE 'Nein'
  END AS bonus_kriterium_ja
FROM king_james kj
WHERE GP IS NOT NULL;


--4. Mehr Heimspiele als Auswärts -- 250K -- Ja
SELECT
  SUM(CASE WHEN UPPER("HomeAway") = 'HOME' THEN 1 ELSE 0 END) AS heimspiele,
  SUM(CASE WHEN UPPER("HomeAway") = 'AWAY' THEN 1 ELSE 0 END) AS auswaertsspiel,
  CASE
    WHEN SUM(CASE WHEN UPPER("HomeAway") = 'HOME' THEN 1 ELSE 0 END) >
         SUM(CASE WHEN UPPER("HomeAway") = 'AWAY' THEN 1 ELSE 0 END)
    THEN 'Ja'
    ELSE 'Nein'
  END AS bonus_kriterium_ja
FROM king_james kj 
WHERE GP IS NOT NULL;

--Mit Then 1 else 0 setze ich den count für die tabelle fest


--5. In Jedem Kalendermonat ein Spiel Teilgenommen - 50k -- Ja

SELECT
  COUNT(DISTINCT Month) AS monate_im_spielplan,
  COUNT(DISTINCT CASE WHEN GP IS NOT NULL THEN Month END) AS monate_mit_teilnahme,
  CASE
    WHEN COUNT(DISTINCT CASE WHEN GP IS NOT NULL THEN Month END) = COUNT(DISTINCT Month)
    THEN 'Ja'
    ELSE 'Nein'
  END AS bonus_kriterium_erf
FROM king_james kj;



-- Wie viel bonus hat er?


--1. 500k
--2. 500k
--3. 0
--4. 250k
--5. 50
--Gesamt Bonus von Lebron -- 1 mio 300k.











