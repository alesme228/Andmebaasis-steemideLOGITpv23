## Andmetüübid 
1. **Arvulised** - int,decimal(5,2), kus 2 numbri peale koma, bigint,smallint,real
2. **Teksti/sümbolid** - VARCHAR(250), CHAR(10), TEXT
3. Näited: telefoninumber, nimi, nimetus, isikukood, aadress
4. **Kuupäev** - DATE, TIME, date/time
5. **Loogilised** - bit, bool, boolean, true/false

## Piirangud - ограничение
1. Primary key - primaarne võti - первичный ключ - определяет уникальное значение для каждой строки / näärab unikaalne väärtus iga rea kohta.
2. UNIQUE 
3. NOT NULL - не разрешает пустое значение - ei luba tühja väärtust.
4. FOREIGN KEY - võõrvõti / väline võti - вторичный ключ - определяет набор значений из другой таблицы
5. CHECK - CHECK(naine, mees) - определяет набор значений
