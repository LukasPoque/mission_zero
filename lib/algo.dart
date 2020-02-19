var consumption = new Map<String, List>();
//one example run, 10 min
var washing = [
  226.27333333333334,
  1556.3512500000002,
  1570.1,
  78.38625,
  302.69222222222226,
  80.462,
  87.51333333333332,
  79.86666666666666,
  243.6725,
  84.29375000000002,
  3.1566666666666667,
  6.928888888888888,
  4.215000000000001,
  1.6989999999999998
];
var dryer = [
  944.8970000000002,
  1388.957,
  1400.4070000000002,
  1218.1022222222223,
  1397.5260000000003,
  270.133,
  54.658,
  2.1729999999999996,
  14.029,
  19.621111111111116,
  2.102222222222222,
  2.0955555555555554,
  1.2679999999999998,
  0.135
];
var dishes = [
  957.1955555555555,
  1588.2400000000002,
  1490.19,
  32.480000000000004,
  1154.9522222222222,
  2006.9719999999998,
  203.91099999999997,
  0.42125
];

class Algo {
  static List calculateCost(
      int startIndex, int endIndex, String deviceKey, List prices) {
    consumption['dryer'] = dryer;
    consumption['dish_washer'] = dishes;
    consumption['washing_maschine'] = washing;

    int runtimeSteps = consumption[deviceKey].length;

    int latestStartIndex = endIndex - runtimeSteps;
    int timeSteps = (latestStartIndex - startIndex) + 1;
    var results = List(timeSteps);

    for (var i = 0; i < timeSteps; i++) {
      int tmp = startIndex + i;
      double tmpSum = 0;
      for (var j = 0; j < runtimeSteps; j++) {
        tmpSum = tmpSum + consumption[deviceKey][j] * prices[tmp + j];
        results[i] = tmpSum;
      }
    }
    return results;
  }

  static List giveIdealTimes(int startTime, List resultVector) {
    List indexes = [];
    double minVal =
        resultVector.reduce((curr, next) => curr < next ? curr : next);
    for (var i = 0; i < resultVector.length; i++) {
      if (resultVector[i] == minVal) {
        indexes.add(i + startTime);
      }
    }
    return indexes;
  }

  static int timeToIndex(int hour, int minutes) {
    int index = (hour * 6 + minutes / 10).floor();
    return index;
  }

  static String indexToTime(index) {
    int hoursIndex = (index / 6).floor();
    String time = '';
    String add = "";
    int hours = 0;
    int minutes = (index - hoursIndex * 6) * 10;
    if(hoursIndex == 0){
      add = "am";
    } else if(hoursIndex == 24){
      hours = 0;
      add == "am";
    }
    else if(hoursIndex<=11) {
      hours = hoursIndex;
      add = "am";
    } else {
      hours = hoursIndex-12;
      add = "pm";
    }
    if (minutes == 0) {
      time = hours.toString() + ':00'+add;
    } else {
      time = hours.toString() + ':' + minutes.toString()+add;
    }
    return time;
  }

  static String main(h1, m1, h2, m2) {
    int startIndex = timeToIndex(h1, m1);
    int endIndex = timeToIndex(h2, m2);

    // price for energy at several timestamps starting from 0 in 10 minutes steps unit: €/MWh
    var prices = [
      20.64,
      19.385,
      18.13,
      16.875,
      15.620000000000001,
      14.365,
      13.11,
      12.425,
      11.74,
      11.055,
      10.370000000000001,
      9.685,
      9.0,
      8.93,
      8.86,
      8.79,
      8.72,
      8.65,
      8.58,
      8.64,
      8.7,
      8.76,
      8.82,
      8.879999999999999,
      8.94,
      10.02333333333333,
      11.106666666666664,
      12.19,
      13.27333333333333,
      14.356666666666664,
      15.44,
      17.223333333333326,
      19.006666666666664,
      20.79,
      22.573333333333327,
      24.356666666666662,
      26.14,
      27.77166666666666,
      29.40333333333333,
      31.035,
      32.66666666666666,
      34.29833333333333,
      35.93,
      35.7,
      35.47,
      35.239999999999995,
      35.01,
      34.78,
      34.55,
      33.22833333333334,
      31.906666666666673,
      30.585,
      29.26333333333334,
      27.941666666666677,
      26.62,
      24.138333333333343,
      21.656666666666684,
      19.175,
      16.693333333333342,
      14.211666666666686,
      11.73,
      11.593333333333334,
      11.456666666666669,
      11.32,
      11.183333333333334,
      11.046666666666669,
      10.91,
      10.835,
      10.760000000000002,
      10.685,
      10.610000000000001,
      10.535000000000002,
      10.46,
      10.461666666666668,
      10.463333333333335,
      10.465,
      10.466666666666667,
      10.468333333333334,
      10.47,
      10.615,
      10.76,
      10.905000000000001,
      11.049999999999999,
      11.194999999999999,
      11.34,
      13.584999999999992,
      15.829999999999984,
      18.075,
      20.319999999999993,
      22.564999999999984,
      24.81,
      25.531666666666663,
      26.253333333333327,
      26.975,
      27.696666666666665,
      28.41833333333333,
      29.14,
      30.109999999999985,
      31.079999999999995,
      32.05,
      33.01999999999999,
      33.989999999999995,
      34.96,
      35.61333333333332,
      36.266666666666666,
      36.92,
      37.57333333333332,
      38.22666666666667,
      38.88,
      38.818333333333335,
      38.75666666666667,
      38.695,
      38.63333333333333,
      38.571666666666665,
      38.51,
      37.49166666666668,
      36.473333333333336,
      35.455,
      34.43666666666668,
      33.41833333333334,
      32.4,
      31.30333333333335,
      30.206666666666674,
      29.11,
      28.01333333333335,
      26.916666666666675,
      25.82,
      25.718333333333334,
      25.616666666666667,
      25.515,
      25.413333333333334,
      25.311666666666667,
      25.21,
      24.54500000000001,
      23.880000000000006,
      23.215,
      22.550000000000008,
      21.885000000000005,
      21.22,
      21.123333333333335,
      21.026666666666667,
      20.93,
      20.833333333333336,
      20.736666666666668
    ];
    List result =
        calculateCost(startIndex, endIndex, 'washing_maschine', prices);
    List idealIndexes = giveIdealTimes(startIndex, result);
    String time = indexToTime(idealIndexes[0]);
    double idealUse = result[idealIndexes[0] - startIndex]; //money in cents
    return time;
  }
}
