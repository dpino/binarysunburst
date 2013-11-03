Introduction
============

Prints out a chart with the contents of a binary. The information of the binary is extracted with binutils' **nm** command.

A slightly modified version of Evan Martin's [bloat](http://www.github.com/martine/bloat "bloat") tool, converts the output of *nm* into a JSON data file.

Charts
======

There are two types of charts: **WebTreeMap** and **Sunburst**.

WebTreeMap
----------

A WebTreeMap is a zoomeable chart showing different boxes where each box is shown in propotion to its size. A level 0 box can group many different boxes of level 1 and so on.  

    $ ./bin/gen-webtreemap --title "Chrome (binary size)" --output-dir webtreemap-chrome --nm-output nm.out

The code of this chart is based on Evan Martin's [webtreemap](http://www.github.com/martine/webtreemap "webtreemap"). To generate a webtreemap chart (for example for Chrome binary):

To open the chart:

    $ firefox webtreemap-chrome/html/index.html

Binary Sunburst
---------------

A Sunburst chart is a zoomable pie chart grouped by different levels. A segment in level 0 is the parent of many other segments in level 1 and so on. To generate a sunburst chart (for example for Chrome binary):

    $ ./bin/gen-sunburst --title "Chrome (binary size)" --output-dir sunburst-chrome --nm-output nm.out

The code of this chart is based on Mike Bostock's [sunburst](http://bl.ocks.org/mbostock/4063423) and thus it uses [d3.js](http://d3js.org/).

To open the chart:

    $ firefox sunburst-chrome/sunburst.html
