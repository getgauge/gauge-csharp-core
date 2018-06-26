﻿// Copyright 2015 ThoughtWorks, Inc.

// This file is part of Gauge-CSharp.

// Gauge-CSharp is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// Gauge-CSharp is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with Gauge-CSharp.  If not, see <http://www.gnu.org/licenses/>.

using System.Collections.Generic;
using System.Linq;
using Gauge.Messages;
using Google.Protobuf;

namespace Gauge.CSharp.Core
{
    public class GaugeApiConnection : AbstractGaugeConnection, IGaugeApiConnection
    {
        public GaugeApiConnection(ITcpClientWrapper clientWrapper) : base(clientWrapper)
        {
        }

        public IEnumerable<string> GetStepValues(IEnumerable<string> stepTexts, bool hasInlineTable)
        {
            foreach (var stepText in stepTexts)
            {
                var stepValueRequest = new GetStepValueRequest
                {
                    StepText = stepText,
                    HasInlineTable = hasInlineTable
                };
                var stepValueRequestMessage = new APIMessage
                {
                    MessageId = GenerateMessageId(),
                    MessageType = APIMessage.Types.APIMessageType.GetStepValueRequest,
                    StepValueRequest = stepValueRequest
                };
                var apiMessage = WriteAndReadApiMessage(stepValueRequestMessage);
                yield return apiMessage.StepValueResponse.StepValue.StepValue;
            }
        }

        public APIMessage WriteAndReadApiMessage(IMessage stepValueRequestMessage)
        {
            lock (TcpClientWrapper)
            {
                WriteMessage(stepValueRequestMessage);
                return ReadMessage();
            }
        }

        private APIMessage ReadMessage()
        {
            var responseBytes = ReadBytes();
            return APIMessage.Parser.ParseFrom(responseBytes.ToArray());
        }
    }
}