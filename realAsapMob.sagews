︠b5a9cee1-9bd3-41d3-98be-8ca3a785ab28s︠
import random
x_coordinates = random.sample(xrange(11),10)
y_coordinates = random.sample(xrange(11),10)
print "x coordinates:", x_coordinates
print "y coordinates:", y_coordinates
starting_pt = (x_coordinates[0],y_coordinates[0])
starting_pt_graphic = point([x_coordinates[0],y_coordinates[0]])
x_coord_sum = x_coordinates
y_coord_sum = y_coordinates
x_coord_sum.remove(x_coord_sum[0])
y_coord_sum.remove(y_coord_sum[0])
x_coord_len = len(x_coord_sum) + 1
y_coord_len = len(y_coord_sum) + 1
lst = []
points = point(lst)
n = 0
for i in range(9):
    lst += [(x_coordinates[n], y_coordinates[n])]
    n += 1
points = point(lst)
print "destination coordinates:", lst
sum_long = sum(x_coord_sum) + starting_pt[0]
sum_lat = sum(y_coord_sum) + starting_pt[1]
mean_long = sum_long/float(x_coord_len) #float makes sure it doesn't round
mean_lat = sum_lat/float(y_coord_len)
print "mean longitude:", mean_long
print "mean latitude:", mean_lat
print "starting point:", starting_pt
radius_yvalue = mean_lat - starting_pt[1]
radius_xvalue = mean_long - starting_pt[0]
radius_length = sqrt((radius_yvalue)**2 + (radius_xvalue)**2)
print "radius:", radius_length
origin = (mean_long, mean_lat)
print "origin:", origin
var('x y')
circle_equation = (x-mean_long)^2+(y-mean_lat)^2==(radius_length)^2
circle = implicit_plot((x-mean_long)^2+(y-mean_lat)^2==(radius_length)^2,(x,-11,25),(y,-11,25))
show(circle+points)
linesa = line([origin, origin])
for i in lst:
    linesa += line([origin,i])
show (linesa + circle + points + starting_pt_graphic)



def distance(x1,y1,x2,y2):
    return sqrt((x2-x1)**2 + (y2-y1)**2)
    print sqrt((x2-x1)**2 + (y2-y1)**2)

linesb = line([origin, origin])
linesc = line([origin, origin])

for i in lst:
    if distance(mean_long, mean_lat, i[0], i[1]) < radius_length:
        if (i[1]-mean_lat == 0):
            m = 0
        elif i[0] - mean_long == 0:
            pointd = (i[0],i[1]+radius_length)
            linesb += line([origin,pointd])
        else:
            m = (float(i[1])- mean_lat)/(float(i[0])-mean_long)
            #line_equation = "%s(x-%s) + %s" % (m,i[0],i[1])
            if i[0] > mean_long:
                y = m*((i[0] + radius_length) - mean_long) + mean_lat
                pointb = (i[0] + radius_length, y)
                linesb += line([origin, pointb])
            elif i[0] < mean_long:
                y = m*((i[0] - radius_length) - mean_long) + mean_lat
                pointc = (i[0] - radius_length, y)
                linesc += line([origin, pointc])
    else:
        pass

show(linesb + linesc + linesa + circle + points + starting_pt_graphic)
sol=[]
line_equations = []

for i in lst:
    x,y=var('x,y')
    if i[0] - mean_long:
        line_equations += [x == i[0]]
    else:
        m = ((i[1])- mean_lat)/((i[0])-mean_long)
        line_equations += [y == (m*(x-mean_long)+mean_lat)]
line_equations

circle_equation
line_solutions = []
for i in line_equations:
    line_solutions += solve([circle_equation,i],x,y,)
line_solutions

solution_base1 = []
solution_base2 = []
for i in lst:
    zero_div_test = i[0] - mean_long
    if zero_div_test == 0:
        x_int3 = i[0]
        solution_base1.append(x_int3)
    else:
        m = ((i[1])- mean_lat)/((i[0])-mean_long)
        a = (m^2) + 1
        b = -2*((m^2)*mean_long)-(2*mean_long)
        c = (-(radius_length^2) + (mean_long^2) + (m*mean_long)^2)
        funsquare = (b^2)-(4*a*c)
        if funsquare >= 0:
            fun = sqrt(float(funsquare))
            x_int1 = float(-b + fun)/float(2*a)
            x_int2 = float(-b - fun)/float(2*a)
            if i[0] > mean_long and x_int1 > x_int2:
                solution_base1.append(x_int1)
            if i[0] > mean_long and x_int1 < x_int2:
                solution_base1.append(x_int2)
            if i[0] < mean_long and x_int1 > x_int2:
                solution_base1.append(x_int2)
            if i[0] < mean_long and x_int1 < x_int2:
                solution_base1.append(x_int1)
print "x_value_of_ints:", solution_base1
upper_half = []
lower_half = []
int_pts = []
y_int_pts = []
k=0
for i in solution_base1:
    joyous = radius_length^2 - ((i-mean_long)^2)
    y_int_pt1 = sqrt(joyous) + mean_lat
    y_int_pt2 = -sqrt(joyous) + mean_lat
    if lst[k][1] > mean_lat and y_int_pt1 > y_int_pt2:
            y_int_pts.append(y_int_pt1)
    if lst[k][1] > mean_lat and y_int_pt1 < y_int_pt2:
            y_int_pts.append(y_int_pt2)
    if lst[k][1] < mean_lat and y_int_pt1 < y_int_pt2:
            y_int_pts.append(y_int_pt1)
    if lst[k][1] < mean_lat and y_int_pt1 > y_int_pt2:
            y_int_pts.append(y_int_pt2)
    int_pts += [(i, y_int_pts[k])]
    k += 1
int_pts.append((starting_pt))
print "int_pts:", int_pts
for i in int_pts:
    if i[1] > mean_lat:
        upper_half.append(i)
    if i[1] < mean_lat:
        lower_half.append(i)
print "upper half:", upper_half
print "lower half:", lower_half
og_upper_half = []
og_lower_half = []
starting_pt[1]
for i in lst:
    if i[1] > mean_lat:
        og_upper_half.append(i)
    if i[1] < mean_lat:
        og_lower_half.append(i)
if starting_pt[1] > mean_lat:
    og_upper_half.append(starting_pt)
if starting_pt[1] < mean_lat:
    og_lower_half.append(starting_pt)
print "og lower half:", og_lower_half
print "og upper half:", og_upper_half
zipped_upper = zip(upper_half, og_upper_half)
zipped_lower = zip(lower_half, og_lower_half)
print "zipped_upper:", zipped_upper
print "zipped_lower:", zipped_lower
zipped_upper.sort()
zipped_lower.sort()
print "sorted zip upper:", zipped_upper
print "sorted zip lower:", zipped_lower
zipped_lower.reverse()
print "reverse sorted zip lower:", zipped_lower
test_lines_upper = line([origin,origin])
final_lines_u = line([origin,origin])
final_lines_l = line([origin,origin])
for i in range(len(zipped_upper)-1):
    final_lines_u += line([zipped_upper[i][1],zipped_upper[i+1][1]],color="red")
for i in range(len(zipped_lower)-1):
    final_lines_l += line([zipped_lower[i][1],zipped_lower[i+1][1]],color="green")
zipped_lower_len = len(zipped_lower)
zipped_upper_len = len(zipped_upper)
first_line = line([zipped_upper[0][1],zipped_lower[zipped_lower_len-1][1]])
last_line = line([zipped_upper[zipped_upper_len - 1][1], zipped_lower[0][1]])
show (final_lines_u + final_lines_l + first_line + last_line + points + circle + starting_pt_graphic)
sorted_uz_upper = zip (*zipped_upper)
print "sorted uz upper:", sorted_uz_upper
sorted_uz_upper[1]
sorted_uz_lower = zip (*zipped_lower)
sorted_uz_lower[1]
ordered_lst = sorted_uz_upper[1] + sorted_uz_lower[1]
print "sorted uz lower:", sorted_uz_lower
ordered_lst
distances = []
final_list = sorted_uz_upper[1] + sorted_uz_lower[1]
print "final list:", final_list
for i in range(len(final_list)-1):
    distances.append(distance(final_list[i][0],final_list[i][1],final_list[i+1][0],final_list[i+1][1]))
    if i +2 == len(final_list):
        distances.append(distance(final_list[0][0],final_list[0][1],final_list[i+1][0],final_list[i+1][1]))
distances

circle1 = implicit_plot((x-(mean_long-radius_length))**2+(y-(mean_lat+radius_length))**2==radius_length**2,(x,-20,30),(y,-20,30))
circle2 = implicit_plot((x-(mean_long+radius_length))**2+(y-(mean_lat+radius_length))**2==radius_length**2,(x,-20,30),(y,-20,30))
circle3 = implicit_plot((x-(mean_long+radius_length))**2+(y-(mean_lat-radius_length))**2==radius_length**2,(x,-20,30),(y,-20,30))
circle4 = implicit_plot((x-(mean_long-radius_length))**2+(y-(mean_lat-radius_length))**2==radius_length**2,(x,-20,30),(y,-20,30))
smCircleHelper = distance(mean_long-radius_length, mean_lat+radius_length, mean_long+radius_length, mean_lat-radius_length)
small_circle_rad = (smCircleHelper - (2*radius_length))/2
small_circle = implicit_plot((x-mean_long)**2+(y-mean_lat)**2==small_circle_rad**2,(x,-20,30),(y,-20,30))
show(circle1+circle2+circle3+circle4+circle+small_circle)
show(circle1+circle2+circle3+circle4+small_circle+points+starting_pt_graphic)
#just a concept but what if we like make circles in each of the quadrants of the 4 circles and use that for our ratio thing. It's complicated but I'll draw it out and send you a pic. But do the same method with each of those circles. Ignore the bad drawing. They're all supposed to be circles but if the points are inside of the smaller circle, we do those points to the smaller circle and if it's not, we connect it the circle of the quadrant it's in. and then we use go around the order of the circles in a circle if that makes sense. So like start with quad 2, then quad 1, then quad 4, then quad 3. Doing smaller circles within each circle and then combining those lists, into one large list going around in that circle. I'm not sure where to put the inner points though. Maybe put it in, when it reaches the point not on the inside circle, but the closest to it? that's pretty confusing. sorry
︡5fec34ba-0a61-43aa-94b3-ec0fcd889c3e︡{"stdout":"x coordinates: [10, 2, 3, 5, 0, 9, 6, 1, 7, 8]\n"}︡{"stdout":"y coordinates: [5, 7, 9, 6, 10, 3, 2, 0, 4, 8]\n"}︡{"stdout":"destination coordinates: [(2, 7), (3, 9), (5, 6), (0, 10), (9, 3), (6, 2), (1, 0), (7, 4), (8, 8)]\n"}︡{"stdout":"mean longitude: 5.1\n"}︡{"stdout":"mean latitude: 5.4\n"}︡{"stdout":"starting point: (10, 5)\n"}︡{"stdout":"radius: 4.91629942131\n"}︡{"stdout":"origin: (5.1, 5.4)\n"}︡{"stdout":"(x, y)\n"}︡{"file":{"filename":"/projects/dabd3c7d-402a-483f-a841-8023f7b6bcbc/.sage/temp/compute2-us/10569/tmp_JGubAI.svg","show":true,"text":null,"uuid":"89254b8b-ef3c-4167-885f-60caae0b1f05"},"once":false}︡{"html":"<div align='center'></div>"}︡{"file":{"filename":"/projects/dabd3c7d-402a-483f-a841-8023f7b6bcbc/.sage/temp/compute2-us/10569/tmp_jMjJYR.svg","show":true,"text":null,"uuid":"828f38d5-c10f-401c-bd10-2ed3e7efff5b"},"once":false}︡{"html":"<div align='center'></div>"}︡{"file":{"filename":"/projects/dabd3c7d-402a-483f-a841-8023f7b6bcbc/.sage/temp/compute2-us/10569/tmp_pu0kjm.svg","show":true,"text":null,"uuid":"a0266a5a-17f5-4c0f-9e61-3e17f78aa1d2"},"once":false}︡{"html":"<div align='center'></div>"}︡{"stdout":"[x == 2, x == 3, x == 5, x == 0, x == 9, x == 6, x == 1, x == 7, x == 8]\n"}︡{"stdout":"(x - 5.1)^2 + (y - 5.4)^2 == 24.170000000000005\n"}︡{"stdout":"[[x == 2, y == -2/5*sqrt(91) + 27/5], [x == 2, y == 2/5*sqrt(91) + 27/5], [x == 3, y == -1/5*sqrt(494) + 27/5], [x == 3, y == 1/5*sqrt(494) + 27/5], [x == 5, y == -2/5*sqrt(151) + 27/5], [x == 5, y == 2/5*sqrt(151) + 27/5], [x == 0, y == -1/5*I*sqrt(46) + 27/5], [x == 0, y == 1/5*I*sqrt(46) + 27/5], [x == 9, y == -4/5*sqrt(14) + 27/5], [x == 9, y == 4/5*sqrt(14) + 27/5], [x == 6, y == -2/5*sqrt(146) + 27/5], [x == 6, y == 2/5*sqrt(146) + 27/5], [x == 1, y == -2/5*sqrt(46) + 27/5], [x == 1, y == 2/5*sqrt(46) + 27/5], [x == 7, y == -1/5*sqrt(514) + 27/5], [x == 7, y == 1/5*sqrt(514) + 27/5], [x == 8, y == -1/5*sqrt(394) + 27/5], [x == 8, y == 1/5*sqrt(394) + 27/5]]\n"}︡{"stdout":"x_value_of_ints: [0.7312747779546241, 2.6228191687996776, 4.291765353846275, 1.449304897735078, 9.287007289570731, 6.358044446201178, 2.127068312384232, 9.057895547304808, 8.760526310177493]\n"}︡{"stdout":"int_pts: [(0.7312747779546241, 7.6548259210556795), (2.6228191687996776, 9.646595710629125), (4.291765353846275, 10.249407876922374), (1.449304897735078, 8.692783817729145), (9.287007289570731, 2.8233801294949306), (6.358044446201178, 0.6473876476844467), (2.127068312384232, 1.484431435823136), (9.057895547304808, 2.483655912512247), (8.760526310177493, 8.68185117464189), (10, 5)]\n"}︡{"stdout":"upper half: [(0.7312747779546241, 7.6548259210556795), (2.6228191687996776, 9.646595710629125), (4.291765353846275, 10.249407876922374), (1.449304897735078, 8.692783817729145), (8.760526310177493, 8.68185117464189)]\n"}︡{"stdout":"lower half: [(9.287007289570731, 2.8233801294949306), (6.358044446201178, 0.6473876476844467), (2.127068312384232, 1.484431435823136), (9.057895547304808, 2.483655912512247), (10, 5)]\n"}︡{"stdout":"5\n"}︡{"stdout":"og lower half: [(9, 3), (6, 2), (1, 0), (7, 4), (10, 5)]\n"}︡{"stdout":"og upper half: [(2, 7), (3, 9), (5, 6), (0, 10), (8, 8)]\n"}︡{"stdout":"zipped_upper: [((0.7312747779546241, 7.6548259210556795), (2, 7)), ((2.6228191687996776, 9.646595710629125), (3, 9)), ((4.291765353846275, 10.249407876922374), (5, 6)), ((1.449304897735078, 8.692783817729145), (0, 10)), ((8.760526310177493, 8.68185117464189), (8, 8))]\n"}︡{"stdout":"zipped_lower: [((9.287007289570731, 2.8233801294949306), (9, 3)), ((6.358044446201178, 0.6473876476844467), (6, 2)), ((2.127068312384232, 1.484431435823136), (1, 0)), ((9.057895547304808, 2.483655912512247), (7, 4)), ((10, 5), (10, 5))]\n"}︡{"stdout":"sorted zip upper: [((0.7312747779546241, 7.6548259210556795), (2, 7)), ((1.449304897735078, 8.692783817729145), (0, 10)), ((2.6228191687996776, 9.646595710629125), (3, 9)), ((4.291765353846275, 10.249407876922374), (5, 6)), ((8.760526310177493, 8.68185117464189), (8, 8))]\n"}︡{"stdout":"sorted zip lower: [((2.127068312384232, 1.484431435823136), (1, 0)), ((6.358044446201178, 0.6473876476844467), (6, 2)), ((9.057895547304808, 2.483655912512247), (7, 4)), ((9.287007289570731, 2.8233801294949306), (9, 3)), ((10, 5), (10, 5))]\n"}︡{"stdout":"reverse sorted zip lower: [((10, 5), (10, 5)), ((9.287007289570731, 2.8233801294949306), (9, 3)), ((9.057895547304808, 2.483655912512247), (7, 4)), ((6.358044446201178, 0.6473876476844467), (6, 2)), ((2.127068312384232, 1.484431435823136), (1, 0))]\n"}︡{"file":{"filename":"/projects/dabd3c7d-402a-483f-a841-8023f7b6bcbc/.sage/temp/compute2-us/10569/tmp_6RF9gx.svg","show":true,"text":null,"uuid":"be984bce-19c0-45c3-89fe-6956b92e2481"},"once":false}︡{"html":"<div align='center'></div>"}︡{"stdout":"sorted uz upper: [((0.7312747779546241, 7.6548259210556795), (1.449304897735078, 8.692783817729145), (2.6228191687996776, 9.646595710629125), (4.291765353846275, 10.249407876922374), (8.760526310177493, 8.68185117464189)), ((2, 7), (0, 10), (3, 9), (5, 6), (8, 8))]\n"}︡{"stdout":"((2, 7), (0, 10), (3, 9), (5, 6), (8, 8))\n"}︡{"stdout":"((10, 5), (9, 3), (7, 4), (6, 2), (1, 0))\n"}︡{"stdout":"sorted uz lower: [((10, 5), (9.287007289570731, 2.8233801294949306), (9.057895547304808, 2.483655912512247), (6.358044446201178, 0.6473876476844467), (2.127068312384232, 1.484431435823136)), ((10, 5), (9, 3), (7, 4), (6, 2), (1, 0))]\n"}︡{"stdout":"((2, 7), (0, 10), (3, 9), (5, 6), (8, 8), (10, 5), (9, 3), (7, 4), (6, 2), (1, 0))\n"}︡{"stdout":"final list: ((2, 7), (0, 10), (3, 9), (5, 6), (8, 8), (10, 5), (9, 3), (7, 4), (6, 2), (1, 0))\n"}︡{"stdout":"[sqrt(13), sqrt(10), sqrt(13), sqrt(13), sqrt(13), sqrt(5), sqrt(5), sqrt(5), sqrt(29), 5*sqrt(2)]\n"}︡{"file":{"filename":"/projects/dabd3c7d-402a-483f-a841-8023f7b6bcbc/.sage/temp/compute2-us/10569/tmp_vdWAJU.svg","show":true,"text":null,"uuid":"cc23bee4-0509-4b18-a5dd-79c8ca384436"},"once":false}︡{"html":"<div align='center'></div>"}︡{"file":{"filename":"/projects/dabd3c7d-402a-483f-a841-8023f7b6bcbc/.sage/temp/compute2-us/10569/tmp_J30z8w.svg","show":true,"text":null,"uuid":"8bfd0925-3858-40ef-838d-cf5182e1efa4"},"once":false}︡{"html":"<div align='center'></div>"}︡{"done":true}︡
︠f0d58652-814d-42bc-b966-dffe526c0003︠
#RULES
#1. Start with the starting point, go clockwise on circle that it's in
#2. New rule
#3.









