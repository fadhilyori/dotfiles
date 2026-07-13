import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  const baseUrl = `${process.env.PERSONAL_BASE_URL}/v1`;
  if (!baseUrl) {
    throw new Error("PERSONAL_BASE_URL env var is not set");
  }

  pi.registerProvider("work", {
    baseUrl,
    apiKey: "$PERSONAL_API_KEY",
    api: "openai-responses",
    headers: {
      "x-bf-disable-content-logging": "true"
    },
    models: [
      {
        id: "deepseek-v4-flash",
        name: "DeepSeek V4 Flash",
        reasoning: true,
        input: ["text"],
        contextWindow: 1000000,
        maxTokens: 384000,
        thinkingLevelMap: {
          minimal: null,
          low: "low",
          medium: "medium",
          high: "high",
          xhigh: "max"
        },
        cost: {
          input: 0.14,
          output: 0.28,
          cacheRead: 0.0028,
          cacheWrite: 0
        }
      },
      {
        id: "deepseek-v4-pro",
        name: "DeepSeek V4 Pro",
        reasoning: true,
        input: ["text"],
        contextWindow: 1000000,
        maxTokens: 384000,
        thinkingLevelMap: {
          minimal: null,
          low: "low",
          medium: "medium",
          high: "high",
          xhigh: "max"
        },
        cost: {
          input: 0.435,
          output: 0.87,
          cacheRead: 0.003625,
          cacheWrite: 0
        }
      }
    ]
  });
}
