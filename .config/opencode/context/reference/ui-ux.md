<!-- Context: reference/ui-ux | Priority: medium | Version: 2.0 | Updated: 2026-03-25 -->

# UI/UX Design Standards

Design principles and patterns for user interface development.

---

## Design System Basics

### Color
- **Perceptually uniform color spaces** (OKLCH, HSLuv) for better accessibility
- **CSS Custom Properties** or variables for theming
- **Theme variables** for light/dark modes

### Typography
- Use established font sources (system fonts, web fonts)
- **Modular scale** for type hierarchy (1.25, 1.5 ratios)
- **Readability**: Minimum 16px base size, 1.5 line-height
- Limit font families (1-2 per project)

### Spacing
- **Grid-based system**: All spacing based on consistent unit (4px, 8px)
- **Consistent scale**: 4, 8, 16, 24, 32, 48, 64, 96

---

## Responsive Design

### Breakpoints (Mobile-First)
```
Base styles: Mobile (0px+)
Tablet: 768px+
Desktop: 1024px+
Large screens: 1440px+
```

### Principles
- Design mobile-first
- Content determines breakpoints, not devices
- Touch targets minimum 44x44px
- Readable font sizes at all breakpoints

---

## Animation Guidelines

### Performance
- Use properties that don't trigger layout (transform, opacity)
- Avoid animating layout properties (width, height, position)
- Use hardware acceleration sparingly
- Respect `prefers-reduced-motion`

### Timing
- **Micro-interactions**: 150-300ms
- **Page transitions**: 300-500ms
- **Standard easing**: ease-out for entrances, ease-in for exits

### Best Practices
- Animations should have purpose
- Keep animations subtle
- Provide instant feedback for interactions
- Don't block user during animations

---

## Accessibility (a11y)

### Requirements
- **WCAG 2.1 AA** compliance minimum
- **Keyboard navigation**: All interactive elements accessible
- **Screen readers**: Proper labels and roles
- **Color contrast**: 4.5:1 for normal text, 3:1 for large text

### Patterns
- Provide text alternatives for images
- Use proper heading hierarchy
- Label all form controls
- Show clear focus indicators
- Error messages are clear and helpful

---

## Component Patterns

### Cards
- Clear visual hierarchy
- Consistent padding
- Actionable elements clearly marked

### Forms
- Group related fields
- Show validation errors inline
- Use appropriate input types
- Disable submit during processing

### Modals/Dialogs
- Trap focus inside modal
- Close on Escape key
- Close on backdrop click (optional)
- Return focus to trigger on close

### Navigation
- Consistent placement
- Clear current location
- Logical grouping
- Responsive behavior

---

## Layout Principles

### Visual Hierarchy
- Size and weight establish importance
- Proximity groups related elements
- Alignment creates order
- White space reduces clutter

### Content-First
- Content determines layout, not vice versa
- Responsive to content length
- Handles edge cases gracefully

---

## Interaction Design

### Feedback
- Immediate response to user actions
- Loading states for async operations
- Error states are helpful
- Success confirmations when needed

### Affordances
- Interactive elements look interactive
- Buttons look like buttons
- Links look like links
- Form fields look editable

---

## Best Practices

✅ Design for your users' needs  
✅ Consistency across the interface  
✅ Clear visual hierarchy  
✅ Accessible to all users  
✅ Performance-conscious  
✅ Test on real devices

❌ Don't design for yourself  
❌ Don't break platform conventions  
❌ Don't sacrifice usability for aesthetics  
❌ Don't ignore accessibility  
❌ Don't use animation without purpose
