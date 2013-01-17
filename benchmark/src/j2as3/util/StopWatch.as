/* Copyright 2008 Mike Slinn (mslinn@mslinn.com)
 * 
 * Mike Slinn licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 * 
 * $Id: StopWatch.as 23 2009-03-04 18:42:25Z mslinn $ */

package j2as3.util {
    import flash.utils.getTimer;    
    import mx.formatters.NumberBaseRoundType;
    import mx.formatters.NumberFormatter;

    /** Measures and reports elapsed time. */
	public class StopWatch {
        public var millis:uint = 0;
        private static var tenthsSecondFormatter:NumberFormatter = new NumberFormatter();

		public function StopWatch() {
            tenthsSecondFormatter.precision = 2;
            tenthsSecondFormatter.rounding = NumberBaseRoundType.NEAREST;
		}

        public function reportElapsedTime(msg:String):String {
            var now:uint = getTimer();
            var elapsedSeconds:Number = (now - millis) / 1000.0;
            var reportMsg:String = msg + ": " + tenthsSecondFormatter.format(elapsedSeconds) + " seconds";
            trace(reportMsg);
            millis = now;
            return reportMsg;
        }
        
        public function startTimer():void { millis = getTimer(); }
	}
}