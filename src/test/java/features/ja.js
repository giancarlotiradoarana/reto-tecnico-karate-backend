instrument {overlay = true,
           name = 'SuperTrend AFFINITY',
                overlay= true }



input_group {
    "Periodo Max/Min",
    doch_time = input {default = "30", type = input.string}
}

input_group {
    "Periodo da Micro Tendencia",
    emaa_per = input {default = "21", type = input.string}
}

input_group {
    "Periodo da  Macro Tendencia",
    emab_per = input {default = "200", type = input.string}
}

input_group {
    "Media Rapida",
    emac_per = input {default = "7", type = input.string}
}

input_group {
    "Media Lenta",
    emad_per = input {default = "17", type = input.string}
}


input_group {
    "Candles",
    positivo = input { default = "#1aed02",type = input.color },
    neutro = input { default = "white", type = input.color },
    negativo = input { default = "#fa0b02",  type = input.color },
}

--PARAMETROS

EMAA   = ema(close,emaa_per)
EMAB   = ema(close,emab_per)
EMAC   = ema(hlc3,emac_per)
EMAD   = ema(hlc3,emad_per)
upper  = highest (high, doch_time)
lower  = lowest  (low,  doch_time)

--CALCULOS

TA    = ((close > close[1]) and (close > EMAA) and (EMAA > EMAA[1]))
TB    = ((close < close[1]) and (close < EMAA) and (EMAA < EMAA[1]))
ENC   = ((EMAC[1] < EMAD[1]) and (EMAC > EMAD))
ENV   = ((EMAC[1] > EMAD[1]) and (EMAC < EMAD))

sec = security (current_ticker_id, "1m")
if sec then

local bar_color

if (TA == true) then
    bar_color = positivo
elseif (TB == true) then
    bar_color = negativo
else
    bar_color = neutro
end

    plot_candle (open, high, low, close, "ES", bar_color)
    plot (upper, "Resistencia", upline_color)
    plot (lower, "Suporte",lowline_color)





end

instrument {
    name = 'SuperTrend AFFINITY',
    short_name = 'SuperTrend AFFINITY',
    icon = 'indicators:ADX',
    overlay = true
}

MaFast_period = input(20,"Ma Fast period",input.integer,1,1000,1)
MaFast_average = input(2,"Ma Fast average", input.string_selection,averages.titles)
MaFast_title = input(1,"Ma Fast title", input.string_selection,inputs.titles)

MaSlow_period = input(8,"Ma Slow period",input.integer,1,1000,1)
MaSlow_average = input(2,"Ma Slow average", input.string_selection,averages.titles)
MaSlow_title = input(1,"Ma Slow title", input.string_selection,inputs.titles)

Signal_period = input(6,"Signal period",input.integer,1,1000,1)

MaTrend_period = input(200,"Ma Trend period",input.integer,1,1000,5)
MaTrend_average = input(2,"Ma Trend average", input.string_selection,averages.titles)
MaTrend_title = input(1,"Ma Trend title", input.string_selection,inputs.titles)



input_group {
    "Area Up and Down",
    colorAreaUp = input { default = "rgba(220, 20, 60, 0.3)", type = input.color },
    colorAreaDown = input { default = "rgba(34, 139, 34, 0.3)", type = input.color },
    visibleArea = input { default = true, type = input.plot_visibility }
}

input_group {
    "Ma Fast Line",
    colorFast = input { default = "#00fcdf", type = input.color },
    widthFast = input { default = 1, type = input.line_width},
    visibleFast = input { default = true, type = input.plot_visibility }
}

input_group {
    "Ma Slow Line",
    colorSlow = input { default = "#00fcdf", type = input.color },
    widthSlow = input { default = 2, type = input.line_width},
    visibleSlow = input { default = false, type = input.plot_visibility }
}

input_group {
    "Buy Klen",
    backgroundcolorbuy = input { default = "lime", type = input.color },
    visibleBuy2 = input { default = true, type = input.plot_visibility }
}

input_group {
    "Sell Klen",
    backgroundcolorsell = input { default = "red", type = input.color },
    visibleSell2 = input { default = true, type = input.plot_visibility }
}

local avgFast = averages[MaFast_average]
local titleFast = inputs[MaFast_title]

local avgSlow = averages[MaSlow_average]
local titleSlow = inputs[MaSlow_title]

local avgSignal = averages[Signal_period]

local avgTrend = averages[MaTrend_average]
local titleTrend = inputs[MaTrend_title]

if visibleFast == true then
    plot(avgFast(titleFast,MaFast_period),"Ma Fast",colorFast,widthFast)
end

if visibleSlow == true then
    plot(avgSlow(titleSlow,MaSlow_period),"Ma Slow",colorSlow,widthSlow)
end

if visibleTrend == true then
    plot(avgTrend(titleTrend,MaTrend_period),"Ma Trend",colorTrend,widthTrend)
end

candle_time = {"1s", "5s", "10s", "15s", "30s", "1m", "2m", "5m", "10m", "15m", "30m", "1H", "2H", "4H", "8H", "12H", "1D", "1W", "1M", "1Y"}
candle_time_res = input(6,"Candle check resolution",input.string_selection,candle_time)

sec = security (current_ticker_id, candle_time[candle_time_res])

filter_source = {"1s", "5s", "10s", "15s", "30s", "1m", "2m", "5m", "10m", "15m", "30m", "1H", "2H", "4H", "8H", "12H", "1D", "1W", "1M", "1Y"}
filter_pa_index = input(8,"Candle check resolution",input.string_selection,filter_source)

filter_pa = security (current_ticker_id, filter_source[filter_pa_index])

--print(filter_source[filter_pa_index])

emaFast = avgFast(titleFast,MaFast_period)
emaSlow = avgSlow(titleSlow,MaSlow_period)
macd = emaFast - emaSlow

signal = avgSignal(macd,Signal_period)

--plot(macd,"macd", "Blue", 1)
--plot(signal,"signal", "Orange", 1)

histo = macd - signal

--rect {
    --first = 0,
    --second = histo,
    --color = histo >= histo[1] and "LimeGreen" or "Orange",
    --width = 0.5
--}

--hline(0,"Zero Macd", "rgba(255, 20, 147, 0.4)",1)

if (sec ~= nil) then

    MaFast0 = avgFast(titleFast,MaFast_period) --Ma Fast bar 0
    MaFast1 = MaFast0[1]                       --Ma Fast bar 1

    MaSlow0 = avgSlow(titleSlow,MaSlow_period) --Ma Slow bar 0
    MaSlow1 = MaSlow0[1]

    MaTrend0 = avgTrend(titleTrend,MaTrend_period)
    MaTrend1 = MaTrend0[1]

    if(visibleBuy2 == true) then
        --if(filter_pa.close[1] > filter_pa.open[1] and filter_pa.close[2] < filter_pa.open[2] and filter_pa.close[1] > filter_pa.open[2] and filter_pa.open[1] <= filter_pa.close[2] and abs(filter_pa.close[1]-filter_pa.open[1]) > abs(filter_pa.close[2]-filter_pa.open[2]) ) then
            plot_shape((open[3] < close[3] and open[2] < close[2] and open[1] > close[1] and close[1] > open[2] and open[1] > open[2] and open < close),
                "ACIMA",
                shape_style.square,
                shape_size.block,
                 backgroundcolorbuy,
                shape_location.belowbar,
                0,
                                                                                                                                                                                                                                                                              "COMPRA AHORA",
                                                                                                                                                                                                                                                                              "#e9e9e7"
               )
    --end
    end

    if (visibleSell2 == true) then
        --if(filter_pa.close[1] < filter_pa.open[1] and filter_pa.close[2] > filter_pa.open[2] and filter_pa.close[1] < filter_pa.open[2] and filter_pa.open[1] >= filter_pa.close[2] and abs(filter_pa.close[1]-filter_pa.open[1]) > abs(filter_pa.close[2]-filter_pa.open[2]) ) then
           plot_shape((open[3] > close[3] and open[2] > close[2] and open[1] < close[1] and close[1] < open[2] and open[1] < open[2] and open > close),
                "ABAIXO",
                shape_style.square,
                shape_size.block,
                 backgroundcolorsell,
                shape_location.abovebar,
                0,
                                                                                                                                                                                                                                                                                "VENDA AHORA",
                                                                                                                                                                                                                                                                                "#e9e9e7"
            )
        --end
    end



    if (visibleArea == true) then
        fill(MaFast0,MaSlow0,"Area", MaFast0 > MaSlow0 and colorAreaUp or MaFast0 < MaSlow0 and colorAreaDown )

   end


end