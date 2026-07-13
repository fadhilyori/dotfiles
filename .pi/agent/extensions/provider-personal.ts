import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  const baseUrl = `${process.env.PERSONAL_BASE_URL}/anthropic/v1`;
  if (!baseUrl) {
    throw new Error("PERSONAL_BASE_URL env var is not set");
  }

  pi.registerProvider("personal", {
    baseUrl,
    apiKey: "$PERSONAL_API_KEY",
    api: "anthropic-messages",
    headers: {
      "x-bf-disable-content-logging": "false"
    },
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
        id: "glm-5.2",
        name: "GLM-5.2",
        reasoning: true,
        input: ["text"],
        contextWindow: 1000000,
        maxTokens: 131072,
        cost: {
          input: 0.6,
          output: 2.2,
          cacheRead: 0.11,
          cacheWrite: 0
        }
      }
    ]
  });
}
