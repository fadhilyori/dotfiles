import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  const baseUrl = process.env.PERSONAL_ANTHROPIC_BASE_URL;
  if (!baseUrl) {
    throw new Error("PERSONAL_ANTHROPIC_BASE_URL env var is not set");
  }

  pi.registerProvider("personal", {
    baseUrl,
    apiKey: "$PERSONAL_ANTHROPIC_API_KEY",
    api: "anthropic-messages",
    models: [
      {
        id: "MiniMax-M3",
        name: "MiniMax-M3",
        reasoning: true,
        input: ["text", "image"],
        contextWindow: 1000000,
        maxTokens: 128000,
        thinkingLevelMap: {
          minimal: null,
          low: null,
          medium: null,
          high: "adaptive",
          xhigh: null
        },
        cost: {
          input: 0.3,
          output: 1.2,
          cacheRead: 0.06,
          cacheWrite: 0
        }
      },
      {
        id: "MiniMax-M2.7",
        name: "MiniMax-M2.7",
        reasoning: true,
        input: ["text"],
        contextWindow: 204800,
        maxTokens: 131072,
        cost: {
          input: 0.3,
          output: 1.2,
          cacheRead: 0.06,
          cacheWrite: 0.375
        }
      },
      {
        id: "MiniMax-M2.7-highspeed",
        name: "MiniMax-M2.7 High Speed",
        reasoning: true,
        input: ["text"],
        contextWindow: 204800,
        maxTokens: 131072,
        cost: {
          input: 0.6,
          output: 2.4,
          cacheRead: 0.06,
          cacheWrite: 0.375
        }
      },
    ]
  });
}
