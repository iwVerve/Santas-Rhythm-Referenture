///award_grade(grade, points)

var grade = argument[0];
var awarded_points = 100;
if argument_count > 1 {
    awarded_points = argument[1];
}

with(objOverpassWorld) {
    display_grade = grade;
    display_time = display_duration;
    
    if grade > 0 {
        var mult;
        if grade == 1 {
            mult = 1;
        }
        else if grade == 2 {
            mult = 1 + min(combo, 4) / 4;
            combo += 1;
        }
        points += mult * awarded_points;        
    }
    else {
        combo = 0;
    }
    if grade >= 0 {
        hits[grade] += 1;
    }
    else {
        hits[0] += 1;
    }
}
