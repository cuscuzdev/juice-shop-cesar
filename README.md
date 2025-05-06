# GitHub Actions: Segurança e Qualidade de Código

Este projeto utiliza uma série de workflows do GitHub Actions voltados à segurança e qualidade. As ferramentas foram escolhidas com base em uso real no mercado, facilidade de integração e foco em problemas comuns que costumam aparecer em aplicações Node.js com front-end em JavaScript/HTML.

## Análise Estática com Semgrep

O Semgrep foi incluído para fazer análise estática de segurança (SAST) no código. Ele é leve, fácil de configurar e tem um bom conjunto de regras voltadas para aplicações web. Usamos regras relacionadas ao OWASP Top 10, além de regras específicas para JavaScript e HTML voltadas a problemas como XSS.

Essa escolha veio da necessidade de pegar vulnerabilidades ainda na fase de desenvolvimento, antes mesmo de testes ou execução do código. É uma camada preventiva, que ajuda a corrigir falhas antes de virarem problemas maiores.

## Gitleaks para Detecção de Segredos

Gitleaks está configurado para rodar em todos os pull requests. O motivo é simples: é comum, principalmente em times maiores, alguém acabar subindo uma chave de API, token de acesso ou alguma outra informação sensível sem perceber. Com essa checagem automática, conseguimos barrar esse tipo de erro antes que ele vá para a branch principal.

É uma ferramenta leve, confiável e com boa manutenção — faz bem o que se propõe.

## Lint de Workflows com actionlint

Workflows mal configurados no GitHub Actions simplesmente não rodam, e o erro às vezes passa despercebido. Por isso, adicionamos o actionlint. Ele faz uma verificação dos arquivos YAML dos workflows para garantir que estejam válidos.

Essa verificação é limitada a mudanças em arquivos da pasta `.github/workflows/` para não adicionar custo desnecessário à pipeline em alterações que não envolvam CI/CD.

## Auditoria de Dependências com npm audit

Dependências desatualizadas ou com falhas conhecidas são uma das principais portas de entrada para ataques em aplicações Node.js. Por isso, incluímos uma checagem com `npm audit` sempre que há push ou pull request para a branch principal.

A auditoria está configurada para alertar apenas para vulnerabilidades de nível "alto" pra cima. Isso ajuda a focar no que realmente precisa de atenção, sem encher o time com alertas de baixa prioridade.

## Considerações finais

A ideia aqui não é ter uma pipeline complexa ou exageradamente rígida, mas sim garantir o mínimo de segurança e qualidade no fluxo de desenvolvimento. Cada ferramenta foi escolhida com base em experiências reais, com foco no que costuma dar problema na prática — e automatizar essas verificações reduz bastante o risco de algo passar despercebido.
