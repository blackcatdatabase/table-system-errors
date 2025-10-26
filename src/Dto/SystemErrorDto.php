<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\SystemErrors\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class SystemErrorDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $level,
        public readonly string $message,
        public readonly ?string $exceptionClass,
        public readonly ?string $file,
        public readonly ?int $line,
        public readonly ?string $stackTrace,
        public readonly ?string $token,
        public readonly array|null $context,
        public readonly ?string $fingerprint,
        public readonly int $occurrences,
        public readonly ?int $userId,
        public readonly ?string $ipHash,
        public readonly ?string $ipHashKeyVersion,
        public readonly ?string $ipText,
        public readonly ?string $ipBin,
        public readonly ?string $userAgent,
        public readonly ?string $url,
        public readonly ?string $method,
        public readonly ?int $httpStatus,
        public readonly bool $resolved,
        public readonly ?int $resolvedBy,
        public readonly ?\DateTimeImmutable $resolvedAt,
        public readonly \DateTimeImmutable $createdAt,
        public readonly \DateTimeImmutable $lastSeen
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}
