<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\SystemErrors\Dto;

/**
 * Simple immutable DTO with public readonly properties.
 * - No logic; just a data carrier.
 * - Strong types enforce the contract across layers.
 */
final class SystemErrorDto implements \JsonSerializable {
    public function __construct(
        public readonly int $id,
        public readonly string $level,
        public readonly string $message,
        public readonly ?string $exceptionClass,
        public readonly ?string $file,
        public readonly ?int $line,
        public readonly ?string $stackTrace,
        #[\SensitiveParameter] public readonly ?string $token,
        public readonly array|null $context,
        public readonly ?string $fingerprint,
        public readonly int $occurrences,
        public readonly ?int $userId,
        #[\SensitiveParameter] public readonly ?string $ipHash,
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

    /** Suitable for serialization/logging (without large blobs). */
    public function toArray(): array {
        return get_object_vars($this);
    }

    /** toArray() without null values - for clean logging/diffs. */
    public function toArrayNonNull(): array {
        return array_filter(get_object_vars($this), static fn($v) => $v !== null);
    }

    public function jsonSerialize(): array {
       $a = $this->toArray();
       foreach ($a as $k => $v) {
           if ($v instanceof \DateTimeInterface) {
               // ISO-8601 with a timezone; switch to 'Y-m-d H:i:s.u' if needed
               $a[$k] = $v->format(\DateTimeInterface::ATOM);
           }
       }
       return $a;
   }
}
